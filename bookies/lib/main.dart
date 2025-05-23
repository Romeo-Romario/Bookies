import 'package:bookies/data/database_initializer.dart';
import 'package:bookies/data/repository/authors_list_repository.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/bookmark_repository.dart';
import 'package:bookies/data/repository/folders_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:bookies/data/repository/statistics_repository.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/book/list/book_list_page.dart';
import 'package:bookies/shared/theme/app_theme.dart';
import 'package:bookies/shared/theme/color_seed.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = DriftAppDatabase();

  final container = GetIt.I;

  container
    ..registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance(),
    )
    ..registerSingleton<BookRepository>(
      BookRepositoryImpl(database),
    )
    ..registerSingleton<GenreRepository>(
      GenreRepositoryImpl(database),
    )
    ..registerSingleton<AuthorRepository>(
      AuthorRepositoryImpl(database),
    )
    ..registerSingleton<AuthorsListRepository>(
      AuthorsListRepositoryImpl(database),
    )
    ..registerSingleton<BookmarkRepository>(
      BookmarkRepositoryImpl(database),
    )
    ..registerSingleton<StatisticsRepository>(
      StatisticsRepositoryImpl(database),
    )
    ..registerSingleton<FoldersRepository>(
      FoldersRepositoryImpl(database),
    );

  await DatabaseInitializer.builtInEntitiesInitializer(
    GetIt.I.get(),
    GetIt.I.get(),
  );

  final theme = AppTheme(mode: ThemeMode.light, seed: ColorSeed.baseColor);

  runApp(MaterialApp(
    // initialRoute: '/home',
    debugShowCheckedModeBanner: false,
    themeMode: theme.mode,
    theme: theme.asLight(),
    darkTheme: theme.asDark(),
    routes: {
      '/': (context) => BookListPage(),
      '/adding': (context) {
        final folderId = ModalRoute.of(context)!.settings.arguments as int?;
        return BookAddPage.create(folderId: folderId);
      },
    },
  ));
}
