import 'package:bookies/data/source/drift/drift_app_database.dart';

abstract class BookmarkRepository {
  Future add(String title, String text);
  Future update(int id, String title, String text);
  Future delete(int id);
  Future search(String line, int sortType);
  Future getOne(int id);
}

class BookmarkRepositoryImpl extends BookmarkRepository {
  final DriftAppDatabase source;

  BookmarkRepositoryImpl(this.source);

  @override
  Future add(String title, String text) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future update(int id, String title, String text) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future search(String line, int sortType) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
