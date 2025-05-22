import 'package:bookies/data/entities/statistics/author_book_count.dart';
import 'package:bookies/data/entities/statistics/book_grade_per_genre.dart';
import 'package:bookies/data/entities/statistics/books_by_genre.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

sealed class StatisticsRepository {
  Future<List<BooksByGenre>> groupAllBooksByGenre();
  Future<List<BookGradePerGenre>> getAverageGradePerGenre();
  Future<List<AuthorBookCount>> getAuthorBookCount();

  Future<int> getBookFolderCount();
  Future<int> getBookmarkCount();

  Future<int> getBookCount();
}

class StatisticsRepositoryImpl extends StatisticsRepository {
  final DriftAppDatabase database;

  StatisticsRepositoryImpl(this.database);

  @override
  Future<List<BooksByGenre>> groupAllBooksByGenre() async {
    final result = await database
        .groupAllBooksByGenre()
        .map(
          (row) => BooksByGenre(
            genreName: row.read('genre_name'),
            bookCount: row.read<int>('book_count'),
          ),
        )
        .get();

    return result;
  }

  @override
  Future<List<BookGradePerGenre>> getAverageGradePerGenre() async {
    final result = await database
        .getAverageGradePerGenre()
        .map(
          (row) => BookGradePerGenre(
            genreName: row.read<String>('genre_name'),
            averageGrade: row.read<double>('avg_grade'),
          ),
        )
        .get();

    return result;
  }

  @override
  Future<List<AuthorBookCount>> getAuthorBookCount() async {
    final result = await database
        .getAuthorBookCount()
        .map(
          (row) => AuthorBookCount(
            author: row.read<String>('author_fullname'),
            count: row.read<int>('book_count'),
          ),
        )
        .get();

    return result;
  }

  @override
  Future<int> getBookmarkCount() {
    return database.managers.bookmarkInfo.count();
  }

  @override
  Future<int> getBookFolderCount() {
    return database.managers.booksFolderInfoTable.count();
  }

  @override
  Future<int> getBookCount() {
    return database.managers.bookInfoTable.count();
  }
}

extension StatisticsRepositoryQuery on DriftAppDatabase {
  Selectable<QueryRow> groupAllBooksByGenre() {
    return customSelect(
      '''
    SELECT genres_info_table.genre_name, COUNT(*) AS book_count
    FROM book_info_table
    JOIN genres_info_table
      ON book_info_table.genre_id = genres_info_table.genre_id
    GROUP BY genres_info_table.genre_name
    ''',
      readsFrom: {bookInfoTable, genresInfoTable},
    );
  }

  Selectable<QueryRow> getAverageGradePerGenre() {
    return customSelect(
      '''
    SELECT genres_info_table.genre_name, AVG(book_info_table.grade) AS avg_grade
    FROM book_info_table
    JOIN genres_info_table
      ON book_info_table.genre_id = genres_info_table.genre_id
    WHERE book_info_table.grade IS NOT NULL
    GROUP BY genres_info_table.genre_name
    ''',
      readsFrom: {bookInfoTable, genresInfoTable},
    );
  }

  Selectable<QueryRow> getAuthorBookCount() {
    return customSelect(
      '''
    SELECT authors_info_table.author_fullname, COUNT(authors_list_table.book_id) AS book_count
    FROM authors_list_table
    JOIN authors_info_table
      ON authors_list_table.authors_id = authors_info_table.author_id
    GROUP BY authors_list_table.authors_id
    ''',
      readsFrom: {authorsListTable, authorsInfoTable},
    );
  }
}
