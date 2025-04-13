import 'package:bookies/data/source/drift/drift_app_database.dart';

abstract class ReadingUpdateRepository {
  Future<void> add(int bookId, int pageNumber);
}

class ReadingUpdateRepositoryImpl extends ReadingUpdateRepository {
  final DriftAppDatabase source;

  ReadingUpdateRepositoryImpl(this.source);

  @override
  Future<void> add(int bookId, int pageNumber) async {
    source.into(source.readingUpdateInfo).insert(
        ReadingUpdateInfoCompanion.insert(
            book_id: bookId, page_number: pageNumber));
  }
}
