import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class AuthorRepository {
  Future<int> add(String name);
  Future<List<AuthorEntity>> search(String? text);
  Future<List<AuthorEntity>> getAllByBook(int bookId);
}

class AuthorRepositoryImpl extends AuthorRepository {
  final DriftAppDatabase source;

  AuthorRepositoryImpl(this.source);

  @override
  Future<int> add(String name) {
    return source.into(source.authorsInfoTable).insert(
          AuthorsInfoTableCompanion.insert(author_fullname: name),
        );
  }

  @override
  Future<List<AuthorEntity>> search(String? text) {
    if (text == null || text.isEmpty) {
      return source.select(source.authorsInfoTable).map(map).get();
    }

    final query = source.select(source.authorsInfoTable)
      ..where(
        (tbl) => tbl.author_fullname.upper().contains(text),
      );

    return query.map(map).get();
  }

  static AuthorEntity map(AuthorsInfoTableData data) {
    return AuthorEntity(
      id: data.author_id,
      fullName: data.author_fullname,
    );
  }

  @override
  Future<List<AuthorEntity>> getAllByBook(int bookId) async {
    final query = source.select(source.authorsListTable).join([
      leftOuterJoin(
        source.authorsInfoTable, // The table to join
        source.authorsInfoTable.author_id
            .equalsExp(source.authorsListTable.authors_id),
      )
    ])
      ..where(source.authorsListTable.book_id.equals(bookId));

    final authorBookPairs = await query.get();

    return authorBookPairs
        .map((e) => AuthorEntity(
              id: e.readTable(source.authorsInfoTable).author_id,
              fullName: e.readTable(source.authorsInfoTable).author_fullname,
            ))
        .toList();
  }
}
