import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class AuthorsRepository {
  Future<int> add(String name);
  Future<List<AuthorEntity>> search(String? text);
}

class AuthorsRepositoryImpl extends AuthorsRepository {
  final DriftAppDatabase source;

  AuthorsRepositoryImpl(this.source);

  @override
  Future<int> add(String name) {
    return source.into(source.authorsInfoTable).insert(
          AuthorsInfoTableCompanion.insert(author_fullname: name),
        );
  }

  @override
  Future<List<AuthorEntity>> search(String? text) {
    if (text == null || text.isEmpty) {
      return source.select(source.authorsInfoTable).map(map).get();
    }

    final query = source.select(source.authorsInfoTable)
      ..where(
        (tbl) => tbl.author_fullname.upper().contains(text),
      );

    return query.map(map).get();
  }

  static AuthorEntity map(AuthorsInfoTableData data) {
    return AuthorEntity(
      id: data.author_id,
      fullName: data.author_fullname,
    );
  }
}
