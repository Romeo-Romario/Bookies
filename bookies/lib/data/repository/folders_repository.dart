import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/source/drift/drift_app_database.dart';
import 'package:drift/drift.dart';

abstract class FoldersRepository {
  Future add({required FolderEntity entity});
  Future update(int folderId, String name, String? font);
  Future delete(int folderId, bool option);
  Future<List<FolderEntity>> getAll(int? parentFolderId);
  Future<FolderEntity?> getOne(int? id);
}

class FoldersRepositoryImpl extends FoldersRepository {
  final DriftAppDatabase source;

  FoldersRepositoryImpl(this.source);

  @override
  Future add({required FolderEntity entity}) {
    return source.into(source.booksFolderInfoTable).insert(
        BooksFolderInfoTableCompanion.insert(
            books_folder_name: entity.booksFolderName,
            font_style: Value(entity.fontStyle),
            parent_book_folder_id: Value(entity.parentFolderId)));
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
  Future delete(int folderId, bool option) async {
    // if option = true delete folder and all its dependencies
    // if option = false update all it's dependencies parent folder id to this folder parent id and delete the folder
    if (option) {
      //Delete all books
      // List<int> deleteBooksId = [];
      // final getBooksIdQuery = source.select(source.bookInfoTable)
      //   ..where((tbl) => tbl.books_folder_id.equals(folderId));
      // deleteBooksId = await getBooksIdQuery.map((p0) => p0.book_id).get();

      // //Iterate through books and delete them
      // for (var i = 0; i < deleteBooksId.length; i++) {
      //   bookRepository.delete(deleteBooksId[i]);
      // }

      // //Get all folders that have this folder as parent
      // List<int> deleteFoldersId = [];
      // final getFoldersIdQuety = source.select(source.booksFolderInfoTable)
      //   ..where(
      //     (tbl) => tbl.parent_book_folder_id.equals(folderId),
      //   );

      // deleteFoldersId = await getFoldersIdQuety
      //     .map(
      //       (p0) => p0.books_folder_id,
      //     )
      //     .get();

      // for (var i = 0; i < deleteFoldersId.length; i++) {
      //   delete(deleteFoldersId[i], true);
      // }

      final result = await source.managers.booksFolderInfoTable
          .filter(
            (f) => f.books_folder_id.equals(folderId),
          )
          .delete();

      print(result);
    } else {}
    // final query = source.select(source.booksFolderInfoTable)
    //   ..where((tbl) => tbl.books_folder_id.equals(folderId))
    //   ..limit(1);

    // // this is the id in which our folder exist
    // final int? parentFolderif =
    //     await query.map((row) => row.parent_book_folder_id).getSingleOrNull();
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
              fontStyle: p0.font_style!),
        )
        .get();
  }

  @override
  Future<FolderEntity?> getOne(int? id) {
    return source.managers.booksFolderInfoTable
        .filter(
          (f) => f.books_folder_id.equals(id),
        )
        .map(
          (p0) => FolderEntity(
            booksFolderId: p0.books_folder_id,
            booksFolderName: p0.books_folder_name,
            parentFolderId: p0.parent_book_folder_id,
            fontStyle: p0.font_style!,
          ),
        )
        .getSingleOrNull();
  }
}
