import 'package:bookies/data/entities/bookmark_entity.dart';
import 'package:bookies/features/bookmark/detail/bookmark_detail.dart';
import 'package:flutter/material.dart';

class BookmarkCard extends StatelessWidget {
  final int bookId;
  final VoidCallback func;
  final bool option;
  final BookmarkEntity bookmark;
  const BookmarkCard(
      {super.key,
      required this.bookId,
      required this.func,
      required this.option,
      required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookmarkDetail(
                bookId: bookId,
                func: func,
                option: option,
                bookmark: bookmark,
              ),
            )),
        title: Text(bookmark.title!),
        subtitle: Text(
          bookmark.text,
          maxLines: 4,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
