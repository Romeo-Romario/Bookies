import 'package:bookies/services/shared/db/data.dart';
import 'package:drift/drift.dart';

class AuthorsRecomendation {
  Database db = Database();

  Future<List<AuthorsInfoTableData>> getAuthors(String? startingSymbols) {
    if (startingSymbols == "" || startingSymbols == null) {
      return db.select(db.authorsInfoTable).get();
    }
    final query = db.select(db.authorsInfoTable)
      // ..where((tbl) => tbl.author_fullname.upper().like('$startingSymbols%'));
      ..where((tbl) => tbl.author_fullname.upper().contains(startingSymbols));
    return query.get();
  }
}
