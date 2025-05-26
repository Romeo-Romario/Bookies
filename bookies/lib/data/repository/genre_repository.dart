import 'package:bookies/data/entities/genre_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class GenreRepository {
  Future<int> add(String genre);
  Future<List<GenreEntity>> getAll();
  Future<GenreEntity> search(int searchedGenreId);
  Future<int> clear();
}

class GenreRepositoryImpl extends GenreRepository {
  final DriftAppDatabase source;
  GenreRepositoryImpl(this.source);

  @override
  Future<int> add(String genre) async {
    final query = source.select(source.genresInfoTable)
      ..where((tbl) => tbl.genre_name.equals(genre));

    final exist = await query.getSingleOrNull();

    if (exist != null) {
      return exist.genre_id;
    }

    return source
        .into(source.genresInfoTable)
        .insert(GenresInfoTableCompanion.insert(
          genre_name: genre,
          built_in: Value(true),
        ));
  }

  @override
  Future<List<GenreEntity>> getAll() {
    return source.select(source.genresInfoTable).map(map).get();
  }

  GenreEntity map(GenresInfoTableData data) {
    return GenreEntity(
      id: data.genre_id,
      name: data.genre_name,
      builtIn: data.built_in,
    );
  }

  @override
  Future<GenreEntity> search(int searchedGenreId) {
    final query = source.select(source.genresInfoTable)
      ..where(
        (tbl) => tbl.genre_id.equals(searchedGenreId),
      );
    final result = query
        .map(
          (p0) => GenreEntity(
              id: p0.genre_id, name: p0.genre_name, builtIn: p0.built_in),
        )
        .getSingle();
    return result;
  }

  @override
  Future<int> clear() {
    return source.delete(source.genresInfoTable).go();
  }
}
