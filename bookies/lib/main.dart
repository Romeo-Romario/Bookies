import 'package:bookies/data/database_initializer.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/book/list/book_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = DriftAppDatabase();

  GetIt.I.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  GetIt.I.registerSingleton<BookRepository>(
    BookRepositoryImpl(database),
  );
  GetIt.I.registerSingleton<GenreRepository>(
    GenreRepositoryImpl(database),
  );
  GetIt.I.registerSingleton<AuthorsRepository>(
    AuthorsRepositoryImpl(database),
  );

  await DatabaseInitializer.builtInEntitiesInitializer(
    GetIt.I.get(),
    GetIt.I.get(),
  );

  runApp(MaterialApp(
    // initialRoute: '/home',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/': (context) => BookListPage(),
      '/adding': (contex) => BookAddPage(),
    },
  ));
}
