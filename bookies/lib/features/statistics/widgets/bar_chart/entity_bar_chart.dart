import 'package:bookies/shared/theme/theme_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EntityBarChart extends StatelessWidget {
  final double? height;

  final int entityCount;
  final double Function(int index) getEntityRod;
  final String Function(int index) getEntityTooltipMessage;

  final String leftAxisName;

  final double? maxY;

  const EntityBarChart({
    super.key,
    this.height,
    this.maxY,
    required this.entityCount,
    required this.getEntityRod,
    required this.getEntityTooltipMessage,
    required this.leftAxisName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          maxY: maxY,
          barGroups: _groups(context),
          titlesData: _titlesData(context),
          barTouchData: _barTouchData(context),
          gridData: FlGridData(
            getDrawingHorizontalLine: (value) => FlLine(
              dashArray: [8],
              strokeWidth: 2,
              color: context.colorScheme.secondaryContainer,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              dashArray: [8],
              strokeWidth: 2,
              color: context.colorScheme.secondaryContainer,
            ),
          ),
          borderData: FlBorderData(
            border: Border.all(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _groups(BuildContext context) {
    return List.generate(
      entityCount,
      (index) {
        return BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: getEntityRod(index),
              color: context.colorScheme.secondary,
              width: 12,
              borderRadius: const BorderRadius.all(Radius.zero),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  context.colorScheme.tertiary,
                  context.colorScheme.primary,
                ],
              ),
            )
          ],
          showingTooltipIndicators: [0],
        );
      },
    );
  }

  BarTouchData _barTouchData(BuildContext context) {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        fitInsideHorizontally: false,
        fitInsideVertically: false, 
        maxContentWidth: 42,
        tooltipPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        getTooltipColor: (group) => context.colorScheme.primary,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            getEntityTooltipMessage(groupIndex),
            TextStyle(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  FlTitlesData _titlesData(BuildContext context) {
    const reservedSize = 40.0;

    final textStyle = context.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: context.colorScheme.primary,
    );

    return FlTitlesData(
      bottomTitles: AxisTitles(
        axisNameWidget: const SizedBox(),
        axisNameSize: 33,
      ),
      leftTitles: AxisTitles(
        axisNameWidget: Text(
          leftAxisName,
          style: textStyle,
        ),
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: reservedSize,
          getTitlesWidget: (value, meta) => Text(
            value.toInt().toString(),
            style: textStyle,
          ),
        ),
        axisNameSize: 33,
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: reservedSize,
          getTitlesWidget: (value, meta) => const SizedBox(),
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }
}
