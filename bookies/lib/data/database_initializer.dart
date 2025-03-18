import 'package:bookies/data/repository/genre_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseInitializer {
  static Future builtInEntitiesInitializer(
    GenreRepository repository,
    SharedPreferences prefs,
  ) async {
    await repository.clear();
    prefs.clear();

    if ((prefs.getBool('start') ?? true)) {
      await prefs.setBool('start', false);

      List<String> builtInGenres = [
        'Fantasy',
        'Thriller',
        "Romance",
        'Novel',
        "Science Fiction",
        'Detective',
        "Horror",
      ];
      // Insert built in genres into database table
      for (var genre in builtInGenres) {
        await repository.add(genre);
      }
    }
  }
}
