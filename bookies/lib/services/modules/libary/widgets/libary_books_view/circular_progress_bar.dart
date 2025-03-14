import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:bookies/services/shared/custom_enums/image_source_type.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({
    super.key,
    required ValueNotifier<double> valueNotifier,
    required this.element,
  }) : _valueNotifier = valueNotifier;

  final ValueNotifier<double> _valueNotifier;
  final BookInfo element;

  @override
  Widget build(BuildContext context) {
    double imageSize =
        MediaQuery.of(context).size.width * 0.20; // Auto-scaled size

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
          seekSize: 6,
          seekColor: const Color(0xffeeeeee),
        ),

        // Book Image (Inside the Circle)
        Container(
          height: imageSize,
          width: imageSize,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: switch (element.imageSourceType) {
            ImageSourceType.asset =>
              Image.asset(element.imagePath, fit: BoxFit.contain),
            ImageSourceType.local =>
              Image.asset(element.imagePath, fit: BoxFit.contain),
          },
        ),
      ],
    );
  }
}
