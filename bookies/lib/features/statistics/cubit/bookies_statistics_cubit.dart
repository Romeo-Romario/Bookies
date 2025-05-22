import 'dart:ui';

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

    final bookCount = await statisticsRepository.getBookCount();
    final bookFolderCount = await statisticsRepository.getBookFolderCount();
    final bookmarkCount = await statisticsRepository.getBookmarkCount();
    final generes = (await statisticsRepository.groupAllBooksByGenre())
        .map((e) => GenrePieChartItem(
              name: e.genreName,
              count: e.bookCount,
              color: ColorTool.randomV1(),
            ))
        .toList();

    final grades = (await statisticsRepository.getAverageGradePerGenre());

    final authorBookCount = await statisticsRepository.getAuthorBookCount();

    emit(state.copyWith(
      bookCountInfo: CountInfo(title: 'Books', count: bookCount),
      folderCountInfo: CountInfo(title: 'Folders', count: bookFolderCount),
      bookmarkCountInfo: CountInfo(title: 'Bookmarks', count: bookmarkCount),
      genrePieChart: GenrePieChartInfo(selectedIndex: -1, genres: generes),
      gradeBarChartInfo: GradeBarChartInfo(grades: grades),
      authorBookCountBarChartInfo: AuthorBookCountBarChartInfo(
        authorBookCount: authorBookCount,
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
