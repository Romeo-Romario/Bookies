import 'package:bookies/data/entities/book_info_entity.dart';

import 'package:bookies/data/source/drift/book_info_companion_helper.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';

abstract class BookRepository {
  Future<int> add(BookInfoEntity entity);
  Future<List<BookInfoEntity>> getAll();
}

class BookRepositoryImpl extends BookRepository {
  final DriftAppDatabase source;

  BookRepositoryImpl(this.source);

  @override
  Future<int> add(BookInfoEntity entity) async {
    return source
        .into(source.bookInfoTable)
        .insert(BookInfoCompanionHelper.to(entity));
  }

  @override
  Future<List<BookInfoEntity>> getAll() {
    return source
        .select(source.bookInfoTable)
        .map(BookInfoCompanionHelper.from)
        .get();
  }
}
