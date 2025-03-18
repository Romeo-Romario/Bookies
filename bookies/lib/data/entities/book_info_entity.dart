enum ImageSourceType { asset, local }

class BookInfoEntity {
  final int? bookId;
  final int? folderId;
  final String bookName;
  final String imagePath;
  final ImageSourceType imageSourceType;
  final int readPages;
  final int numberOfPages;
  final bool status;
  final int? grade;
  final int? authorId;
  final int? genreId;

  BookInfoEntity({
    required this.bookId,
    required this.folderId,
    required this.bookName,
    required this.imagePath,
    required this.imageSourceType,
    required this.readPages,
    required this.numberOfPages,
    required this.status,
    required this.authorId,
    required this.genreId,
    required this.grade,
  });
}
