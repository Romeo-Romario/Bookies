import 'package:bookies/features/statistics/bookies_statistics_page.dart';
import 'package:bookies/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class StatisticActionButton extends StatelessWidget {
  const StatisticActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        color: context.colorScheme.onPrimary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StatisticPage(),
            ),
          );
        },
        icon: Icon(
          Icons.stacked_line_chart_rounded,
        ),
      ),
    );
  }
}
