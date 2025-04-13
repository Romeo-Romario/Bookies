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
      width: 40,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 40,
        diameterRatio: 1.5,
        offAxisFraction: -0.3,
        magnification: 1.05,
        useMagnifier: true,
        childDelegate: ListWheelChildListDelegate(
          children: numbers
              .map((e) => Center(
                      child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(e.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
