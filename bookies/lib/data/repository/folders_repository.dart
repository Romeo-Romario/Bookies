import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class FoldersRepository {
  Future add(int? parentFolderId, String name, String? font, String color);
  Future update(int folderId, String name, String? font);
  Future delete(int folderId);
  Future<List<FolderEntity>> getAll(int? parentFolderId);
}

class FoldersRepositoryImpl extends FoldersRepository {
  final DriftAppDatabase source;

  FoldersRepositoryImpl(this.source);

  @override
  Future add(int? parentFolderId, String name, String? font, String color) {
    return source.into(source.booksFolderInfoTable).insert(
        BooksFolderInfoTableCompanion.insert(
            books_folder_name: name,
            font_style: Value(font),
            parent_book_folder_id: Value(parentFolderId)));
  }

  @override
  Future update(int folderId, String name, String? font) {
    return source.managers.booksFolderInfoTable
        .filter(
          (f) => f.books_folder_id.equals(folderId),
        )
        .update(
          (o) => o(books_folder_name: Value(name), font_style: Value(font)),
        );
  }

  @override
  Future delete(int folderId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<FolderEntity>> getAll(int? parentFolderId) {
    final query = source.select(source.booksFolderInfoTable);

    if (parentFolderId == null) {
      query.where((tbl) => tbl.parent_book_folder_id.isNull());
    } else {
      query.where((tbl) => tbl.parent_book_folder_id.equals(parentFolderId));
    }

    return query
        .map(
          (p0) => FolderEntity(
              booksFolderId: p0.books_folder_id,
              booksFolderName: p0.books_folder_name,
              parentFolderId: p0.parent_book_folder_id,
              fontStyle: p0.font_style,
              color: p0.font_color),
        )
        .get();
  }
}
