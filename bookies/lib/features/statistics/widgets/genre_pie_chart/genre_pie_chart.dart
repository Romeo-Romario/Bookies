import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/genre_pie_chart/pie_chart_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenrePieChart extends StatelessWidget {
  const GenrePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final genrePieChart = context.select(
      (BookiesStatisticsCubit value) => value.state.genrePieChart,
    );

    final genres = genrePieChart.genres;

    final bloc = context.read<BookiesStatisticsCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            genres.length,
            (index) {
              final genre = genres[index];

              return PieChartIndicator(
                color: genre.color,
                text: genre.name,
                selected: genrePieChart.indexSameAs(index),
              );
            },
          ),
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, pieTouchResponse) {
                  final isMoveOutside = !event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null;

                  if (isMoveOutside) {
                    bloc.genreDeselectedIndex();

                    return;
                  }

                  bloc.genreSelectedIndex(
                    pieTouchResponse.touchedSection!.touchedSectionIndex,
                  );
                },
              ),
              startDegreeOffset: 180,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 0,
              sections: showingSections(genrePieChart),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(GenrePieChartInfo genrePieChart) {
    final genres = genrePieChart.genres;

    return List.generate(
      genres.length,
      (index) {
        final isTouched = genrePieChart.indexSameAs(index);
        const color0 = Colors.blue;

        final genre = genres[index];

        return PieChartSectionData(
          color: genre.color,
          value: genre.count.toDouble(),
          title: '',
          radius: 80,
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withValues(alpha: 0)),
        );

        // switch (i) {
        //   case 0:
        //     return PieChartSectionData(
        //       color: color0,
        //       value: 25,
        //       title: '',
        //       radius: 80,
        //       titlePositionPercentageOffset: 0.55,
        //       borderSide: isTouched
        //           ? const BorderSide(color: Colors.white, width: 6)
        //           : BorderSide(color: Colors.white.withValues(alpha: 0)),
        //     );
        //   case 1:
        //     return PieChartSectionData(
        //       color: color1,
        //       value: 25,
        //       title: '',
        //       radius: 65,
        //       titlePositionPercentageOffset: 0.55,
        //       borderSide: isTouched
        //           ? const BorderSide(color: Colors.white, width: 6)
        //           : BorderSide(color: Colors.white.withValues(alpha: 0)),
        //     );
        //   case 2:
        //     return PieChartSectionData(
        //       color: color2,
        //       value: 25,
        //       title: '',
        //       radius: 60,
        //       titlePositionPercentageOffset: 0.6,
        //       borderSide: isTouched
        //           ? const BorderSide(color: Colors.white, width: 6)
        //           : BorderSide(color: Colors.white.withValues(alpha: 0)),
        //     );
        //   case 3:
        //     return PieChartSectionData(
        //       color: color3,
        //       value: 25,
        //       title: '',
        //       radius: 70,
        //       titlePositionPercentageOffset: 0.55,
        //       borderSide: isTouched
        //           ? const BorderSide(color: Colors.white, width: 6)
        //           : BorderSide(color: Colors.white.withValues(alpha: 0)),
        //     );
        //   default:
        //     throw Error();
        // }
      },
    );
  }
}
