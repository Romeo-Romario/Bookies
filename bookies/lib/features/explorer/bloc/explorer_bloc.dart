import 'package:bookies/data/entities/book_info_entity.dart';
import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/data/repository/explorer_repository.dart';
import 'package:bookies/data/repository/folders_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explorer_event.dart';
part 'explorer_state.dart';

class ExplorerBloc extends Bloc<ExplorerEvent, ExplorerState> {
  final ExplorerRepository explorerRepository;
  final FoldersRepository folderRepository;

  ExplorerBloc({
    required this.explorerRepository,
    required this.folderRepository,
  }) : super(ExplorerState.initial()) {
    on<ExplorerStarted>((event, emit) async {
      emit(state.copyWith(loadStatus: ExplorerLoadStatus.loading));

      final data = await explorerRepository.allByFolder(null);

      emit(
        state.copyWith(
          exploredFolder: () => null,
          folders: data.folders,
          books: data.books,
          loadStatus: ExplorerLoadStatus.loaded,
        ),
      );
    });
    on<ExplorerNavigateRequested>((event, emit) async {
      emit(state.copyWith(loadStatus: ExplorerLoadStatus.loading));

      final data =
          await explorerRepository.allByFolder(event.folder.booksFolderId);

      emit(
        state.copyWith(
          exploredFolder: () => event.folder,
          folders: data.folders,
          books: data.books,
          loadStatus: ExplorerLoadStatus.loaded,
        ),
      );
    });
    on<ExplorerNavigateBackRequested>((event, emit) async {
      emit(state.copyWith(loadStatus: ExplorerLoadStatus.loading));

      final exploredBefore = state.exploredFolder;

      if (exploredBefore == null) {
        if (kDebugMode) {
          print(
            '[ExplorerBloc] on ExplorerNavigateBackRequested - cant navigate back',
          );
        }

        return;
      }

      final data = await explorerRepository.allByFolder(
        exploredBefore.parentFolderId,
      );

      final exploredNow = await folderRepository.getOne(
        exploredBefore.parentFolderId,
      );

      emit(
        state.copyWith(
          exploredFolder: () => exploredNow,
          folders: data.folders,
          books: data.books,
          loadStatus: ExplorerLoadStatus.loaded,
        ),
      );
    });
    on<ExplorerRefreshRequested>((event, emit) async {
      emit(state.copyWith(loadStatus: ExplorerLoadStatus.loading));

      final data = await explorerRepository.allByFolder(state.exploredId);

      final reloaded = await folderRepository.getOne(state.exploredId);

      emit(
        state.copyWith(
          exploredFolder: () => reloaded,
          folders: data.folders,
          books: data.books,
          loadStatus: ExplorerLoadStatus.loaded,
        ),
      );
    });
  }
}
