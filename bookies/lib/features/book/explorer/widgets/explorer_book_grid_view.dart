import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/features/book/detail/book_detail.dart';
import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/book/explorer/widgets/circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ExplorerBookGridView extends StatelessWidget {
  const ExplorerBookGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.select(
      (ExplorerBloc value) => value.state.books,
    );

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        mainAxisExtent: 250,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final element = books[index];
        return BookLibaryView(
          element: element,
          onTap: (entity) => _onTap(context, entity),
        );
      },
    );
  }

  Future _onTap(BuildContext context, BookInfoEntity entity) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetail(
          bookId: entity.bookId!,
        ),
      ),
    );

    context.read<ExplorerBloc>().add(ExplorerRefreshRequested());
  }
}

class BookLibaryView extends StatelessWidget {
  final void Function(BookInfoEntity entity) onTap;
  final BookInfoEntity element;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  BookLibaryView({
    super.key,
    required this.element,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(element),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                  maxLines: 2,
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
