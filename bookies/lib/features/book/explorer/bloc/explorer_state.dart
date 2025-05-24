part of 'explorer_bloc.dart';

enum ExplorerLoadStatus {
  loading,
  loaded;

  bool get isLoading => this == loading;
  bool get isLoaded => this == loaded;
}

class ExplorerState {
  final FolderEntity? exploredFolder;

  final List<FolderEntity> folders;
  final List<BookInfoEntity> books;

  final ExplorerLoadStatus loadStatus;

  int? get exploredId => exploredFolder?.booksFolderId;
  String get exploredName => exploredFolder?.booksFolderName ?? 'Library';

  bool get isEmpty => folders.isEmpty && books.isEmpty;

  int get count => folders.length + books.length;

  bool get isRootFolder => exploredFolder == null;

  const ExplorerState({
    required this.exploredFolder,
    required this.folders,
    required this.books,
    required this.loadStatus,
  });
  const ExplorerState.initial()
      : exploredFolder = null,
        folders = const [],
        books = const [],
        loadStatus = ExplorerLoadStatus.loading;

  ExplorerState copyWith({
    FolderEntity? Function()? exploredFolder,
    List<FolderEntity>? folders,
    List<BookInfoEntity>? books,
    ExplorerLoadStatus? loadStatus,
  }) {
    if (exploredFolder == null) {
      return ExplorerState(
        exploredFolder: this.exploredFolder,
        folders: folders ?? this.folders,
        books: books ?? this.books,
        loadStatus: loadStatus ?? this.loadStatus,
      );
    }

    return ExplorerState(
      exploredFolder: exploredFolder.call(),
      folders: folders ?? this.folders,
      books: books ?? this.books,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
