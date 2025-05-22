import 'package:flutter/material.dart';

class PieChartIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool selected;

  const PieChartIndicator({
    super.key,
    required this.color,
    required this.text,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: selected ? 1 : .4,
      duration: Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [Icon(Icons.circle, color: color), Text(text)],
      ),
    );
  }
}
