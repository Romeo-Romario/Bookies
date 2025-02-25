// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'data.g.dart';

class BooksFolderInfoTable extends Table {
  IntColumn get books_folder_id => integer().autoIncrement()();
  TextColumn get books_folder_name => text()();
  //TODO: change from nullable to suitable default value
  TextColumn get font_style => text().nullable()();
  TextColumn get font_color => text().nullable()();
}

class AuthorsInfoTable extends Table {
  IntColumn get author_id => integer().autoIncrement()();
  TextColumn get author_fullname => text()();
}

class GenresInfoTable extends Table {
  IntColumn get genre_id => integer().autoIncrement()();
  TextColumn get genre_name => text()();
  BoolColumn get built_in => boolean().withDefault(Constant(false))();
}

class BookInfoTable extends Table {
  IntColumn get book_id => integer().autoIncrement()();
  IntColumn get books_folder_id => integer()
      .references(BooksFolderInfoTable, #books_folder_id)
      .withDefault(Constant(0))();
  TextColumn get book_name => text()();
  TextColumn get image_path => text()();
  BoolColumn get image_source_type => boolean()();
  IntColumn get read_pages => integer()();
  IntColumn get number_of_pages => integer()();
  BoolColumn get status => boolean()();
  IntColumn get grade => integer()();
  IntColumn get author_id =>
      integer().references(AuthorsInfoTable, #author_id)();
  IntColumn get genre_id => integer().references(GenresInfoTable, #genre_id)();
}

class ReadingUpdateInfo extends Table {
  IntColumn get update_id => integer().autoIncrement()();
  IntColumn get book_id => integer().references(BookInfoTable, #book_id)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get page_number => integer()();
}

class BookmarksFolderInfo extends Table {
  IntColumn get bookmarks_folder_id => integer().autoIncrement()();
  IntColumn get book_id => integer().references(BookInfoTable, #book_id)();
  TextColumn get bookmarks_folder_name => text()();
  TextColumn get bookmarks_folder_color => text()();
}

class BookmarkInfo extends Table {
  IntColumn get bookmark_id => integer().autoIncrement()();
  IntColumn get bookmarks_folder_id => integer()
      .references(BookmarksFolderInfo, #bookmarks_folder_id)
      .withDefault(Constant(0))();
  TextColumn get bookmark_title => text().nullable()();
  TextColumn get bookmark_text => text()();
}

@DriftDatabase(tables: [
  BooksFolderInfoTable,
  AuthorsInfoTable,
  GenresInfoTable,
  BookInfoTable,
  ReadingUpdateInfo,
  BookmarksFolderInfo,
  BookmarkInfo
])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
