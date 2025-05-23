class BookmarkEntity {
  final int? book_id;
  final int? id;
  final DateTime creationTime;
  final String? title;
  final String text;

  BookmarkEntity({
    required this.book_id,
    required this.id,
    required this.creationTime,
    required this.title,
    required this.text,
  });
}
