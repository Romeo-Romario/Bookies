import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/folder/folder_grid_view/folder_libary_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorerFolderGridView extends StatelessWidget {
  const ExplorerFolderGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final folders = context.select(
      (ExplorerBloc value) => value.state.folders,
    );

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        mainAxisExtent: 150,
      ),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        final element = folders[index];
        return FolderLibaryView(
          element: element,
          onTap: (entity) => _onTap(context, entity),
        );
      },
    );
  }

  Future _onTap(BuildContext context, FolderEntity entity) async {
    context.read<ExplorerBloc>().add(ExplorerNavigateRequested(folder: entity));
  }
}
