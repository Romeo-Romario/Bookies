import 'dart:ui';

import 'package:bookies/data/entities/statistics/author_book_count.dart';
import 'package:bookies/data/entities/statistics/book_grade_per_genre.dart';
import 'package:bookies/data/repository/statistics_repository.dart';
import 'package:bookies/shared/theme/color_tool.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookies_statistics_state.dart';

class BookiesStatisticsCubit extends Cubit<BookiesStatisticsState> {
  final StatisticsRepository statisticsRepository;

  BookiesStatisticsCubit({
    required this.statisticsRepository,
  }) : super(BookiesStatisticsState.initial());

  Future init() async {
    // await Future.delayed(Duration(seconds: 1));

    final generes = (await statisticsRepository.groupAllBooksByGenre())
        .map((e) => GenrePieChartItem(
              name: e.genreName,
              count: e.bookCount,
              color: ColorTool.randomV1(),
            ))
        .toList();

    emit(state.copyWith(
      bookCountInfo: CountInfo(
        title: 'Books',
        count: await statisticsRepository.getBookCount(),
      ),
      folderCountInfo: CountInfo(
        title: 'Folders',
        count: await statisticsRepository.getBookFolderCount(),
      ),
      bookmarkCountInfo: CountInfo(
        title: 'Bookmarks',
        count: await statisticsRepository.getBookmarkCount(),
      ),
      totalPageCountInfo: CountInfo(
        title: 'Pages',
        count: await statisticsRepository.getAllPagesCount(),
      ),
      readPageCountInfo: CountInfo(
        title: 'Read',
        count: await statisticsRepository.getReadPagesCount(),
      ),
      leftPageCountInfo: CountInfo(
        title: 'Left',
        count: await statisticsRepository.getLeftPagesCount(),
      ),
      genrePieChart: GenrePieChartInfo(selectedIndex: -1, genres: generes),
      gradeBarChart: GradeBarChartInfo(
        grades: await statisticsRepository.getAverageGradePerGenre(),
      ),
      authorBookCountBarChart: AuthorBookCountBarChartInfo(
        authorBookCount: await statisticsRepository.getAuthorBookCount(),
      ),
      loadingStatus: LoadingStatus.finished,
    ));
  }

  void genreDeselectedIndex() {
    emit(state.copyWith(
      genrePieChart: state.genrePieChart.withDeselection(),
    ));
  }

  void genreSelectedIndex(int index) {
    emit(state.copyWith(
      genrePieChart: state.genrePieChart.withSelection(index),
    ));
  }
}
