import 'package:bookies/data/entities/book_info_entity.dart';

import 'package:bookies/data/source/drift/book_info_companion_helper.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class BookRepository {
  Future<int> add(BookInfoEntity entity);
  Future<List<BookInfoEntity>> getAll();
  Future<BookInfoEntity?> getOne(int bookId);
  Future<void> update(BookInfoEntity entity);
  Future<void> updatePages(int bookId, int readPages);
}

class BookRepositoryImpl extends BookRepository {
  final DriftAppDatabase source;

  BookRepositoryImpl(this.source);

  @override
  Future<int> add(BookInfoEntity entity) async {
    return source
        .into(source.bookInfoTable)
        .insert(BookInfoCompanionHelper.to(entity));
  }

  @override
  Future<List<BookInfoEntity>> getAll() {
    return source
        .select(source.bookInfoTable)
        .map(BookInfoCompanionHelper.from)
        .get();
  }

  @override
  Future<BookInfoEntity?> getOne(int bookId) {
    final query = source.select(source.bookInfoTable)
      ..where((tbl) => tbl.book_id.equals(bookId));
    return query.map(BookInfoCompanionHelper.from).getSingleOrNull();
  }

  @override
  Future<void> update(BookInfoEntity entity) async {
    await source
        .update(source.bookInfoTable)
        .replace(BookInfoCompanionHelper.toEdit(entity));
  }

  @override
  Future<void> updatePages(int bookId, int readPages) async {
    final query = source.update(source.bookInfoTable)
      ..where((tbl) => tbl.book_id.equals(bookId));
    query.write(BookInfoTableCompanion(read_pages: Value(readPages)));
  }
}
