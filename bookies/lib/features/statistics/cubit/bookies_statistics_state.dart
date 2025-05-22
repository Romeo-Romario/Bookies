part of 'bookies_statistics_cubit.dart';

class BookiesStatisticsState {
  final CountInfo bookCountInfo;
  final CountInfo folderCountInfo;
  final CountInfo bookmarkCountInfo;

  final GenrePieChartInfo genrePieChart;
  final GradeBarChartInfo gradeBarChart;
  final AuthorBookCountBarChartInfo authorBookCountBarChart;

  final LoadingStatus loadingStatus;

  BookiesStatisticsState({
    required this.bookCountInfo,
    required this.folderCountInfo,
    required this.bookmarkCountInfo,
    required this.genrePieChart,
    required this.gradeBarChart,
    required this.authorBookCountBarChart,
    required this.loadingStatus,
  });

  BookiesStatisticsState.initial()
      : bookCountInfo = const CountInfo.empty(),
        folderCountInfo = const CountInfo.empty(),
        bookmarkCountInfo = const CountInfo.empty(),
        genrePieChart = const GenrePieChartInfo.empty(),
        gradeBarChart = const GradeBarChartInfo.empty(),
        authorBookCountBarChart = const AuthorBookCountBarChartInfo.empty(),
        loadingStatus = LoadingStatus.loading;

  BookiesStatisticsState copyWith({
    CountInfo? bookCountInfo,
    CountInfo? folderCountInfo,
    CountInfo? bookmarkCountInfo,
    GenrePieChartInfo? genrePieChart,
    GradeBarChartInfo? gradeBarChartInfo,
    AuthorBookCountBarChartInfo? authorBookCountBarChartInfo,
    LoadingStatus? loadingStatus,
  }) {
    return BookiesStatisticsState(
      bookCountInfo: bookCountInfo ?? this.bookCountInfo,
      folderCountInfo: folderCountInfo ?? this.folderCountInfo,
      bookmarkCountInfo: bookmarkCountInfo ?? this.bookmarkCountInfo,
      genrePieChart: genrePieChart ?? this.genrePieChart,
      gradeBarChart: gradeBarChartInfo ?? gradeBarChart,
      authorBookCountBarChart:
          authorBookCountBarChartInfo ?? authorBookCountBarChart,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}

enum LoadingStatus {
  loading,
  finished;

  bool get isLoading => this == loading;
  bool get isFinished => this == finished;
}

class CountInfo {
  final String title;
  final int count;

  CountInfo({required this.title, required this.count});
  const CountInfo.empty()
      : title = '',
        count = 0;
}

class GenrePieChartItem {
  final String name;
  final int count;
  final Color color;

  GenrePieChartItem({
    required this.name,
    required this.count,
    required this.color,
  });
}

class GenrePieChartInfo {
  static const _deselectedIndex = -1;

  final List<GenrePieChartItem> genres;

  final int selectedIndex;

  GenrePieChartInfo({
    required this.selectedIndex,
    required this.genres,
  });

  const GenrePieChartInfo.empty()
      : selectedIndex = _deselectedIndex,
        genres = const [];

  bool get isSelected => selectedIndex != _deselectedIndex;

  bool indexSameAs(int value) {
    return selectedIndex == value;
  }

  GenrePieChartInfo withSelection(int value) {
    if (indexSameAs(value)) {
      return this;
    }

    return copyWith(selectedIndex: value);
  }

  GenrePieChartInfo withDeselection() {
    return copyWith(selectedIndex: _deselectedIndex);
  }

  GenrePieChartInfo copyWith({
    List<GenrePieChartItem>? generes,
    int? selectedIndex,
  }) {
    return GenrePieChartInfo(
      genres: generes ?? genres,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

class GradeBarChartInfo {
  final List<BookGradePerGenre> grades;

  GradeBarChartInfo({required this.grades});
  const GradeBarChartInfo.empty() : grades = const [];
}

class AuthorBookCountBarChartInfo {
  final List<AuthorBookCount> authorBookCount;

  AuthorBookCountBarChartInfo({required this.authorBookCount});
  const AuthorBookCountBarChartInfo.empty() : authorBookCount = const [];
}
