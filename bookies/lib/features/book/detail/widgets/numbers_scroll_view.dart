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
    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: 40,
      childDelegate: ListWheelChildListDelegate(
        children: numbers
            .map((e) => Center(
                    child: Card(
                  child: Text(e.toString(), style: TextStyle(fontSize: 18)),
                )))
            .toList(),
      ),
    );
  }
}
