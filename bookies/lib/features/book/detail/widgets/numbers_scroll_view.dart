import 'package:flutter/material.dart';

class NumbersScrollView extends StatelessWidget {
  const NumbersScrollView({
    super.key,
    required FixedExtentScrollController controller,
    required this.numbers,
  }) : _controller = controller;

  final FixedExtentScrollController _controller;
  final List<int> numbers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 40,
        diameterRatio: 1.2,
        // offAxisFraction: -0.3,
        magnification: 1.08,
        useMagnifier: true,
        childDelegate: ListWheelChildListDelegate(
          children: numbers
              .map((e) => Center(
                      child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(e.toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
