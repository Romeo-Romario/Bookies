import 'package:bookies/services/modules/libary/models/book_info.dart';
import 'package:bookies/services/modules/libary/widgets/circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class BookLibaryView extends StatelessWidget {
  final BookInfo element;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  BookLibaryView({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
              child: CustomCircularProgressBar(
                  valueNotifier: _valueNotifier, element: element),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Text(
                element.bookName,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            if (element.status)
              Flexible(
                  flex: 1,
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
