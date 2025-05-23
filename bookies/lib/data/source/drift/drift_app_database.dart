// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_app_database.g.dart';

class BooksFolderInfoTable extends Table {
  IntColumn get parent_book_folder_id => integer()
      .references(BooksFolderInfoTable, #books_folder_id,
          onDelete: KeyAction.cascade)
      .nullable()(); // Reference books_folder_id
  IntColumn get books_folder_id => integer().autoIncrement()();
  TextColumn get books_folder_name => text()();
  TextColumn get font_style => text().nullable()();
}

class AuthorsInfoTable extends Table {
  IntColumn get author_id => integer().autoIncrement()();
  TextColumn get author_fullname => text().unique()();
}

class AuthorsListTable extends Table {
  IntColumn get authors_id =>
      integer().references(AuthorsInfoTable, #author_id)();
  IntColumn get book_id => integer()
      .references(BookInfoTable, #book_id, onDelete: KeyAction.cascade)();
}

class GenresInfoTable extends Table {
  IntColumn get genre_id => integer().autoIncrement()();
  TextColumn get genre_name => text().unique()();
  BoolColumn get built_in => boolean().withDefault(Constant(false))();
}

class BookInfoTable extends Table {
  IntColumn get book_id => integer().autoIncrement()();
  IntColumn get books_folder_id =>
      integer().references(BooksFolderInfoTable, #books_folder_id).nullable()();
  TextColumn get book_name => text()();
  TextColumn get image_path => text()();
  BoolColumn get image_source_type => boolean()();
  IntColumn get read_pages => integer()();
  IntColumn get number_of_pages => integer()();
  BoolColumn get status => boolean()();
  TextColumn get feedback => text().nullable()();
  RealColumn get grade => real().nullable()();
  IntColumn get genre_id => integer().references(GenresInfoTable, #genre_id)();
}

class ReadingUpdateInfo extends Table {
  IntColumn get update_id => integer().autoIncrement()();
  IntColumn get book_id => integer()
      .references(BookInfoTable, #book_id, onDelete: KeyAction.cascade)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get page_number => integer()();
}

class BookmarkInfo extends Table {
  IntColumn get book_id => integer()
      .references(BookInfoTable, #book_id, onDelete: KeyAction.cascade)();
  IntColumn get bookmark_id => integer().autoIncrement()();
  DateTimeColumn get creationTime =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get bookmark_title => text().nullable()();
  TextColumn get bookmark_text => text()();
}

@DriftDatabase(tables: [
  BooksFolderInfoTable,
  AuthorsInfoTable,
  AuthorsListTable,
  GenresInfoTable,
  BookInfoTable,
  ReadingUpdateInfo,
  BookmarkInfo
])
class DriftAppDatabase extends _$DriftAppDatabase {
  DriftAppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

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
