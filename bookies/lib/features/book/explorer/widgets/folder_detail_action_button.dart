import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/folder/detail/folder_detail_dialog.dart';
import 'package:bookies/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FolderDetailActionButton extends StatelessWidget {
  const FolderDetailActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isRootFolder = context.select(
      (ExplorerBloc value) => value.state.isRootFolder,
    );

    if (isRootFolder) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        color: context.colorScheme.onPrimary,
        onPressed: () async {
          final state = context.read<ExplorerBloc>().state;

          await FolderDetailDialog.showAsDialog(
            context: context,
            folderName: state.exploredName,
            fontStyle: state.exploredFolder!.fontStyle,
            folderId: state.exploredFolder!.booksFolderId!,
            foldersRepository: GetIt.I.get(),
          );
        },
        icon: Icon(
          Icons.settings,
          size: 30,
        ),
      ),
    );
  }
}
