import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/bar_chart/entity_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookGradePerGenreBarChart extends StatelessWidget {
  const BookGradePerGenreBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final gradeBarChartInfo = context.select(
      (BookiesStatisticsCubit value) => value.state.gradeBarChart,
    );

    final grades = gradeBarChartInfo.grades;

    return EntityBarChart(
      height: 300,
      maxY: 5,
      entityCount: grades.length,
      getEntityRod: (index) => grades[index].averageGrade,
      getEntityTooltipMessage: (index) {
        final item = grades[index];

        return '${item.genreName}\n${item.averageGrade}';
      },
      leftAxisName: 'Grades',
    );
  }
}
