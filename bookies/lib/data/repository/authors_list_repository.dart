import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';

abstract class AuthorsListRepository {
  Future<void> add(AuthorsListEntity entity);
  Future<List<AuthorsListEntity>> get(int book_id);
}

class AuthorsListRepositoryImpl extends AuthorsListRepository {
  final DriftAppDatabase source;

  AuthorsListRepositoryImpl(this.source);

  @override
  Future<void> add(AuthorsListEntity entity) async {
    source.into(source.authorsListTable).insert(
        AuthorsListTableCompanion.insert(
            authors_id: entity.authorId, book_id: entity.bookId));
  }

  @override
  Future<List<AuthorsListEntity>> get(int book_id) {
    final query = source.select(source.authorsListTable)
      ..where((tbl) => tbl.book_id.equals(book_id));
    return query
        .map((row) => AuthorsListEntity(
              authorId: row.authors_id,
              bookId: row.book_id,
            ))
        .get();
  }

  // static AuthorsListEntity map(AuthorsListEntity data) {
  //   return AuthorsListEntity(
  //     authorId: data.authorId,
  //     bookId: data.bookId,
  //   );
  // }
}
