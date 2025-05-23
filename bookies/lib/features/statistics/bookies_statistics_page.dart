import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/bar_chart/author_book_count_bar_chart.dart';
import 'package:bookies/features/statistics/widgets/bar_chart/book_grade_per_genre_bar_chart.dart';
import 'package:bookies/features/statistics/widgets/count_info/book_count_card.dart';
import 'package:bookies/features/statistics/widgets/count_info/bookmark_count_card.dart';
import 'package:bookies/features/statistics/widgets/count_info/folder_count_card.dart';
import 'package:bookies/features/statistics/widgets/count_info/left_page_count_card.dart';
import 'package:bookies/features/statistics/widgets/count_info/read_page_count_card.dart';
import 'package:bookies/features/statistics/widgets/count_info/total_page_count_card.dart';
import 'package:bookies/features/statistics/widgets/genre_pie_chart/genre_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookiesStatisticsCubit(
        statisticsRepository: GetIt.I.get(),
      )..init(),
      child: StatistisView(),
    );
  }
}

class StatistisView extends StatelessWidget {
  const StatistisView({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingStatus = context.select(
      (BookiesStatisticsCubit value) => value.state.loadingStatus,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookies Statistics'),
      ),
      body: Skeletonizer(
        enabled: loadingStatus.isLoading,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(flex: 12, child: BookCountCard()),
                Expanded(flex: 10, child: TotalPageCountCard()),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 10, child: ReadPageCountCard()),
                Expanded(flex: 12, child: LeftPageCountCard()),
              ],
            ),
            Row(
              children: [
                Expanded(child: FolderCountCard()),
                Expanded(child: BookmarkCountCard()),
              ],
            ),
            SizedBox(height: 32),
            GenrePieChart(),
            SizedBox(height: 62),
            BookGradePerGenreBarChart(),
            SizedBox(height: 42),
            AuthorBookCountBarChart(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
