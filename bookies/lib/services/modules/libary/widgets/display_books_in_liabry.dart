import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class BookLibaryView extends StatelessWidget {
  final BookInfo element;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  BookLibaryView({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1, // width ÷ height
                valueNotifier: _valueNotifier,
                progress: element.readPages.toDouble(),
                maxProgress: element.numberOfPages.toDouble(),
                startAngle: 225,
                sweepAngle: 270,
                foregroundColor: Colors.green,
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 15,
                backgroundStrokeWidth: 15,
                animation: true,
                seekSize: 6,
                seekColor: const Color(0xffeeeeee),
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) => Container(
                      height: MediaQuery.of(context).size.width * 0.8 * 0.6,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: switch (element.imageSourceType) {
                        ImageSourceType.asset => Image.asset(element.imagePath),
                        ImageSourceType.local => Image.asset(element.imagePath),
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Text(
                element.bookName,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            if (element.status)
              Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: StarRating(
                    rating: element.grade!.toDouble(),
                  )),
          ],
        ),
      ),
    );
  }
}
