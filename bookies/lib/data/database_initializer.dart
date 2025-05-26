import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseInitializer {
  static Future builtInEntitiesInitializer(
    GenreRepository repository,
    SharedPreferences prefs,
  ) async {
    // await repository.clear();
    // prefs.clear();

    //TODO:Delete this lines when everything will be set

    if ((prefs.getBool('start') ?? true)) {
      await prefs.setBool('start', false);

      final AuthorRepository authorsRepository = GetIt.I.get();

      List<String> authors = [
        "Andrzej Sapkowski",
        "Brendon Sanderson",
        "Joe Abercrombie",
        "Roger Zelazny",
        "Sarah J Maas",
        "John Ronald Reuel Tolkien",
      ];

      for (var el in authors) {
        authorsRepository.add(el);
      }

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
