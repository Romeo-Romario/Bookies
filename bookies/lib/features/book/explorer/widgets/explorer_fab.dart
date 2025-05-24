import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/folder/add/folder_add_dialog.dart';
import 'package:bookies/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ExplorerFab extends StatelessWidget {
  final GlobalKey<ExpandableFabState> _fabKey = GlobalKey<ExpandableFabState>();

  ExplorerFab({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: _fabKey,
      type: ExpandableFabType.up,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        size: 56,
        builder: (BuildContext context, void Function()? onPressed,
            Animation<double> progress) {
          return IconButton(
            onPressed: onPressed,
            color: context.colorScheme.primary,
            icon: const Icon(
              Icons.check_circle_outline,
              size: 40,
            ),
          );
        },
      ),
      children: [
        FloatingActionButton.extended(
          onPressed: () => _onAddBook(context),
          heroTag: null,
          label: Text('Add Book'),
          icon: Image.asset(
            "assets/custom_icons/add_book.png",
            width: 24,
            height: 24,
            color: context.colorScheme.primary,
          ),
        ),
        FloatingActionButton.extended(
          onPressed: () => _onAddFolder(context),
          heroTag: null,
          label: Text('Add Folder'),
          icon: Icon(
            Icons.create_new_folder,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Future _onAddFolder(BuildContext context) async {
    final bloc = context.read<ExplorerBloc>();

    await FolderAddDialog.showAsDialog(
      context: context,
      parentFolderId: bloc.state.exploredFolder?.booksFolderId,
    );

    bloc.add(ExplorerRefreshRequested());

    _fabKey.currentState?.toggle();
  }

  Future _onAddBook(BuildContext context) async {
    final bloc = context.read<ExplorerBloc>();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookAddPage.create(
          folderId: bloc.state.exploredFolder?.booksFolderId,
        ),
      ),
    );

    bloc.add(ExplorerRefreshRequested());

    _fabKey.currentState?.toggle();
  }
}
