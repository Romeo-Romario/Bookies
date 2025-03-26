import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/features/book/book_detail/book_detail.dart';
import 'package:bookies/features/book/list/widgets/circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class BookLibaryView extends StatelessWidget {
  final BookInfoEntity element;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  BookLibaryView({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetail(bookInfo: element)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: CustomCircularProgressBar(
                  valueNotifier: _valueNotifier,
                  element: element,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: AutoSizeText(
                  element.bookName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 16,
                  stepGranularity: 1,
                ),
              ),
              if (element.status)
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: StarRating(
                    rating: element.grade!.toDouble(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
