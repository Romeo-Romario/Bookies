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
    double imageSize = MediaQuery.of(context).size.width * 0.25;

    return Stack(
      alignment: Alignment.center, // Ensure everything is centered
      children: [
        // Circular Progress Bar
        DashedCircularProgressBar.aspectRatio(
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
        ),

        // Book Image (Inside the Circle)
        Container(
          height: imageSize,
          width: imageSize,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: switch (element.imageSourceType) {
            ImageSourceType.asset =>
              Image.asset(element.imagePath, fit: BoxFit.contain),
            ImageSourceType.local =>
              Image.file(File(element.imagePath), fit: BoxFit.contain),
          },
        ),
      ],
    );
  }
}
