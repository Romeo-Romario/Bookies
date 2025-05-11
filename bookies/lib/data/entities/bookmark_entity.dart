class BookmarkEntity {
  final int? id;
  final int? folderId;
  final DateTime creationTime;
  final String? title;
  final String text;

  BookmarkEntity({
    required this.id,
    required this.folderId,
    required this.creationTime,
    required this.title,
    required this.text,
  });
}
