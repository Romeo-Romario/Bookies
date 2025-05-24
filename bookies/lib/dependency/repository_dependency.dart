import 'package:bookies/data/database_initializer.dart';
import 'package:bookies/data/repository/authors_list_repository.dart';
import 'package:bookies/data/repository/authors_repository.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/bookmark_repository.dart';
import 'package:bookies/data/repository/explorer_repository.dart';
import 'package:bookies/data/repository/folders_repository.dart';
import 'package:bookies/data/repository/genre_repository.dart';
import 'package:bookies/data/repository/statistics_repository.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:bookies/dependency/app_dependency.dart';
import 'package:get_it/get_it.dart';

class RepositoryDependency extends AppDependency {
  @override
  Future inject(GetIt container) async {
    final database = DriftAppDatabase();

    container
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
      )
      ..registerSingleton<ExplorerRepository>(
        ExplorerRepositoryImpl(container.get(), container.get()),
      );

    await DatabaseInitializer.builtInEntitiesInitializer(
      GetIt.I.get(),
      GetIt.I.get(),
    );
  }
}
