import 'dart:io';

import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({
    super.key,
    required ValueNotifier<double> valueNotifier,
    required this.element,
  }) : _valueNotifier = valueNotifier;

  final ValueNotifier<double> _valueNotifier;
  final BookInfoEntity element;

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.aspectRatio(
      aspectRatio: 1,
      valueNotifier: _valueNotifier,
      progress: element.readPages.toDouble(),
      maxProgress: element.numberOfPages.toDouble(),
      startAngle: 225,
      sweepAngle: 270,
      foregroundColor: Colors.green,
      backgroundColor: const Color(0xffeeeeee),
      foregroundStrokeWidth: 10,
      backgroundStrokeWidth: 10,
      animation: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final widgetSize = Size(constraints.maxWidth, constraints.maxHeight);
          return Hero(
            tag: element.bookId.toString(),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: widgetSize.width * 0.5,
                  height: widgetSize.height * 0.7,
                  child: switch (element.imageSourceType) {
                    ImageSourceType.asset => Image.asset(
                        element.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ImageSourceType.local => Image.file(
                        File(element.imagePath),
                        fit: BoxFit.cover,
                      ),
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
