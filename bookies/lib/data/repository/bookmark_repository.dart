import 'package:bookies/data/entities/bookmark_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class BookmarkRepository {
  Future add(int book_id, String title, String text);
  Future update(int id, String title, String text);
  Future delete(int id);
  Future<List<BookmarkEntity>> search(int book_id, String line, int sortType);
  Future<BookmarkEntity?> getOne(int id);
}

class BookmarkRepositoryImpl extends BookmarkRepository {
  final DriftAppDatabase source;

  BookmarkRepositoryImpl(this.source);

  @override
  Future add(int bookId, String title, String text) {
    return source.into(source.bookmarkInfo).insert(BookmarkInfoCompanion.insert(
        book_id: bookId, bookmark_title: Value(title), bookmark_text: text));
  }

  @override
  Future update(int id, String title, String text) {
    return source.update(source.bookmarkInfo).replace(BookmarkInfoCompanion(
        bookmark_id: Value(id),
        bookmark_text: Value(text),
        bookmark_title: Value(title)));
  }

  @override
  Future<void> delete(int id) async {
    final query = source.delete(source.bookmarkInfo)
      ..where((tbl) => tbl.bookmark_id.equals(id));
    await query.go();
  }

  @override
  Future<List<BookmarkEntity>> search(
      int book_id, String line, int sortType) async {
    /* Sort type classifier
        1 - From new to old
        2 - From old to new
        3 - From A to Z
        4 - From Z to A
     */
    SimpleSelectStatement<$BookmarkInfoTable, BookmarkInfoData> query;
    if (line == null || line.isEmpty) {
      query = source.select(source.bookmarkInfo)
        ..where((tbl) => tbl.book_id.equals(book_id));
    } else {
      query = source.select(source.bookmarkInfo)
        ..where(
          (tbl) => Expression.and([
            tbl.book_id.equals(book_id),
            tbl.bookmark_title.upper().contains(line)
          ]),
        );
    }

    switch (sortType) {
      case 1: // From new to old
        query.orderBy([(tbl) => OrderingTerm.desc(tbl.creationTime)]);
        break;
      case 2: // From old to new
        query.orderBy([(tbl) => OrderingTerm.asc(tbl.creationTime)]);
        break;
      case 3: // From A to Z
        query.orderBy([(tbl) => OrderingTerm.asc(tbl.bookmark_title)]);
        break;
      case 4: // From Z to A
        query.orderBy([(tbl) => OrderingTerm.desc(tbl.bookmark_title)]);
        break;
    }

    return query
        .map(
          (p0) => BookmarkEntity(
              book_id: p0.book_id,
              id: p0.bookmark_id,
              folderId: p0.bookmarks_folder_id,
              creationTime: p0.creationTime,
              title: p0.bookmark_title,
              text: p0.bookmark_text),
        )
        .get();
  }

  @override
  Future<BookmarkEntity?> getOne(int id) async {
    final query = source.select(source.bookmarkInfo)
      ..where((tbl) => tbl.bookmark_id.equals(id));

    return query
        .map(
          (p0) => BookmarkEntity(
              book_id: p0.book_id,
              id: p0.bookmark_id,
              folderId: p0.bookmarks_folder_id,
              creationTime: p0.creationTime,
              title: p0.bookmark_title,
              text: p0.bookmark_text),
        )
        .getSingleOrNull();
  }
}
