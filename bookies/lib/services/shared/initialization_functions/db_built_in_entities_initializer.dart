import 'package:bookies/services/shared/db/data.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

void builtInEntitiesInitializer() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if ((prefs.getBool('start') ?? true)) {
    await prefs.setBool('start', false);
    final database = Database();
    List<String> builtInGenres = [
      'Fantasy',
      'Thriller',
      "Romance",
      'Novel',
      'Detective',
      "Science Fiction",
      "Horror",
    ];
    // Insert built in genres into database table
    for (var genre in builtInGenres) {
      database.into(database.genresInfoTable).insert(
          GenresInfoTableCompanion.insert(
              genre_name: genre, built_in: Value(true)));
    }

    // Insert default bookfolder
    database.into(database.booksFolderInfoTable).insert(
        BooksFolderInfoTableCompanion.insert(
            books_folder_name: "default", books_folder_id: Value(0)));
  }
}
