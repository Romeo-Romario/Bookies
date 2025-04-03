import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/features/book/list/widgets/display_books_in_liabry.dart';
import 'package:flutter/material.dart';

class BookGridView extends StatelessWidget {
  final void Function(BookInfoEntity entity) onTap;
  final List<BookInfoEntity> books;

  const BookGridView({
    super.key,
    required this.books,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          onTap: onTap,
        );
      },
    );
  }
}
