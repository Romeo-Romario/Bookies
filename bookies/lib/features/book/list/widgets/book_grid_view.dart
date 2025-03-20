import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/features/book/list/widgets/display_books_in_liabry.dart';
import 'package:flutter/material.dart';

class BookGridView extends StatelessWidget {
  const BookGridView({
    super.key,
    required this.books,
  });

  final List<BookInfoEntity> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 460,
        mainAxisExtent: 300,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final element = books[index];
        return BookLibaryView(element: element);
      },
    );
  }
}
