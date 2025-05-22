import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/bar_chart/entity_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorBookCountBarChart extends StatelessWidget {
  const AuthorBookCountBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final authorBookCountBarChart = context.select(
      (BookiesStatisticsCubit value) => value.state.authorBookCountBarChart,
    );

    final authorBookCount = authorBookCountBarChart.authorBookCount;

    return EntityBarChart(
      height: 300,
      entityCount: authorBookCount.length,
      getEntityRod: (index) => authorBookCount[index].count.toDouble(),
      getEntityTooltipMessage: (index) {
        final item = authorBookCount[index];

        return '${item.author}\n${item.count}';
      },
      leftAxisName: 'Books',
    );
  }
}
