import 'package:bookies/services/shared/db/data.dart';

enum ImageSourceType { asset, local }

ImageSourceType fromBooleanToImageSourceType(bool value) {
  switch (value) {
    case true:
      return ImageSourceType.local;
    case false:
      return ImageSourceType.asset;
  }
}

class BookInfo {
  final int bookId;
  final int booksFolderId;
  final String bookName;
  final String imagePath;
  final ImageSourceType imageSourceType;
  final int readPages;
  final int numberOfPages;
  final bool status;
  final int? grade;
  final int? authorId;
  final int? genreId;
  BookInfo(
      {required this.bookId,
      required this.booksFolderId,
      required this.bookName,
      required this.imagePath,
      required this.imageSourceType,
      required this.readPages,
      required this.numberOfPages,
      required this.status,
      required this.authorId,
      required this.genreId,
      required this.grade});

  BookInfoTableCompanion toCompanion() {
    return BookInfoTableCompanion.insert(
        book_name: bookName,
        image_path: imagePath,
        image_source_type: (imageSourceType.index != 0),
        read_pages: readPages,
        number_of_pages: numberOfPages,
        status: status,
        grade: grade!,
        author_id: authorId!,
        genre_id: genreId!);
  }

  factory BookInfo.fromBookInfoTable(BookInfoTableData dbSample) => BookInfo(
      bookId: dbSample.book_id,
      booksFolderId: dbSample.books_folder_id,
      bookName: dbSample.book_name,
      imagePath: dbSample.image_path,
      imageSourceType: fromBooleanToImageSourceType(dbSample.image_source_type),
      readPages: dbSample.read_pages,
      numberOfPages: dbSample.number_of_pages,
      status: dbSample.status,
      authorId: dbSample.author_id,
      genreId: dbSample.genre_id,
      grade: dbSample.grade);
}
