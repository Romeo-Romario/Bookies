import 'package:bookies/data/entities/explorer_data.dart';
import 'package:bookies/data/repository/book_repository.dart';
import 'package:bookies/data/repository/folders_repository.dart';

sealed class ExplorerRepository {
  Future<ExplorerData> allByFolder(int? folderId);
}

class ExplorerRepositoryImpl extends ExplorerRepository {
  final BookRepository bookRepository;
  final FoldersRepository folderRepository;

  ExplorerRepositoryImpl(
    this.bookRepository,
    this.folderRepository,
  );

  @override
  Future<ExplorerData> allByFolder(int? folderId) async {
    return ExplorerData(
      folders: await folderRepository.getAll(folderId),
      books: await bookRepository.getAll(folderId),
    );
  }
}
