import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class AuthorsListRepository {
  Future<void> add(AuthorsListEntity entity);
  Future<List<AuthorsListEntity>> get(int book_id);
  Future<void> deletePair(int book_id, int author_id);
}

class AuthorsListRepositoryImpl extends AuthorsListRepository {
  final DriftAppDatabase source;

  AuthorsListRepositoryImpl(this.source);

  @override
  Future<void> add(AuthorsListEntity entity) async {
    source.into(source.authorsListTable).insert(
        AuthorsListTableCompanion.insert(
            authors_id: entity.authorId, book_id: entity.bookId));
    print(
        "the entity with author id: ${entity.authorId} was added to AuthorsListEntity");
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

  Future<void> deletePair(int book_id, int author_id) async {
    final query = source.delete(source.authorsListTable)
      ..where(
        (tbl) => Expression.and(
            [tbl.authors_id.equals(author_id), tbl.book_id.equals(book_id)]),
      );

    await query.go();
    print(
        "The element with book_id: ${book_id} and ${author_id}: should be deleted");
  }
}
