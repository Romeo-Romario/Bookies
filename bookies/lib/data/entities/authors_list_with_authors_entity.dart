import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/entities/authors_list_entity.dart';

class AuthorsListWithAuthorsEntity {
  AuthorsListWithAuthorsEntity(
      {required this.authorEntity, required this.authorsListEntity});

  final AuthorsListEntity authorsListEntity;
  final AuthorEntity? authorEntity;
}
