import 'package:bookies/data/entities/authors_list_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';

abstract class AuthorsListRepository {
  Future<void> add(AuthorsListEntity entity);
}

class AuthorsListRepositoryImpl extends AuthorsListRepository {
  final DriftAppDatabase source;

  AuthorsListRepositoryImpl(this.source);

  @override
  Future<void> add(AuthorsListEntity entity) async {
    source.into(source.authorsListTable).insert(
        AuthorsListTableCompanion.insert(
            authors_id: entity.authorId, book_id: entity.bookId));
  }
}
