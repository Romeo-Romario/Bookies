import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

class BookInfoCompanionHelper {
  static BookInfoTableCompanion to(BookInfoEntity entity) {
    return BookInfoTableCompanion.insert(
      book_name: entity.bookName,
      image_path: entity.imagePath,
      image_source_type: imageSourceTypeToBool(entity.imageSourceType),
      read_pages: entity.readPages,
      number_of_pages: entity.numberOfPages,
      status: entity.status,
      grade: Value(entity.grade),
      feedback: Value(entity.feedback),
      genre_id: entity.genreId!,
    );
  }

  static BookInfoEntity from(BookInfoTableData dbSample) => BookInfoEntity(
        bookId: dbSample.book_id,
        folderId: dbSample.books_folder_id,
        bookName: dbSample.book_name,
        imagePath: dbSample.image_path,
        imageSourceType: boolToImageSourceType(dbSample.image_source_type),
        readPages: dbSample.read_pages,
        numberOfPages: dbSample.number_of_pages,
        status: dbSample.status,
        feedback: dbSample.feedback,
        genreId: dbSample.genre_id,
        grade: dbSample.grade,
      );

  static BookInfoTableCompanion toEdit(BookInfoEntity entity) {
    return BookInfoTableCompanion.insert(
      book_id: Value(entity.bookId!),
      book_name: entity.bookName,
      image_path: entity.imagePath,
      image_source_type: imageSourceTypeToBool(entity.imageSourceType),
      read_pages: entity.readPages,
      number_of_pages: entity.numberOfPages,
      status: entity.status,
      grade: Value(entity.grade),
      feedback: Value(entity.feedback),
      genre_id: entity.genreId!,
    );
  }

  static ImageSourceType boolToImageSourceType(bool value) {
    return value ? ImageSourceType.local : ImageSourceType.asset;
  }

  static bool imageSourceTypeToBool(ImageSourceType value) {
    return value == ImageSourceType.local ? true : false;
  }
}
