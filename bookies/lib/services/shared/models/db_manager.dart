import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:bookies/services/shared/db/data.dart';
import 'package:drift/drift.dart';

class DbManager {
  final Database db = Database();

  Future<List<BookInfoTableData>> getBooks() {
    final query = db.select(db.bookInfoTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.author_id, mode: OrderingMode.desc)
      ]);
    return query.get();
  }

  void addBook(BookInfo el) {
    db.into(db.bookInfoTable).insert(el.toCompanion());
  }

  void addAuthor(String authorName) {}
}
