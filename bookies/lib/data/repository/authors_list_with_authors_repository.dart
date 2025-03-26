import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/entities/authors_list_with_authors_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class AuthorsListWithAuthorsRepository {
  Future<List<AuthorsListWithAuthorsEntity>> getAuthors(int bookId);
}

class AuthorsListWithAuthorsRepositoryImpl
    extends AuthorsListWithAuthorsRepository {
  final DriftAppDatabase source;

  AuthorsListWithAuthorsRepositoryImpl(this.source);

  @override
  Future<List<AuthorsListWithAuthorsEntity>> getAuthors(int bookId) {
    final query = source.select(source.authorsListTable).join([
      leftOuterJoin(
        source.authorsInfoTable, // The table to join
        source.authorsInfoTable.author_id
            .equalsExp(source.authorsListTable.authors_id),
      )
    ])
      ..where(source.authorsListTable.book_id.equals(bookId));

    return query.map((row) {
      return AuthorsListWithAuthorsEntity(
        authorsListEntity: AuthorsListEntity(
            bookId: row.readTable(source.authorsListTable).book_id,
            authorId: row.readTable(source.authorsListTable).authors_id),
        authorEntity: AuthorEntity(
            id: row.readTable(source.authorsInfoTable).author_id,
            fullName: row.readTable(source.authorsInfoTable).author_fullname),
      );
    }).get();
  }
}
