import 'package:flutter/material.dart';

class LabeledContainer extends StatefulWidget {
  final Widget child;
  final String? label;
  const LabeledContainer({required this.child, this.label, super.key});

  @override
  State<LabeledContainer> createState() => _LabeledContainerState();
}

class _LabeledContainerState extends State<LabeledContainer> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.deepPurple[600],
          fontSize: 18,
        ),
        border: InputBorder.none,
      ),
      child: widget.child,
    );
  }
}
