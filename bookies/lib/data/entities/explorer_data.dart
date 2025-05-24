import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/folder_entity.dart';

class ExplorerData {
  final List<FolderEntity> folders;
  final List<BookInfoEntity> books;

  ExplorerData({required this.folders, required this.books});
}
