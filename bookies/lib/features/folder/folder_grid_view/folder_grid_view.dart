import 'package:bookies/data/entities/folder_entity.dart';
import 'package:bookies/features/folder/folder_grid_view/folder_libary_view.dart';
import 'package:flutter/material.dart';

class FolderGridView extends StatelessWidget {
  final void Function(FolderEntity entity) onTap;
  final List<FolderEntity> folders;

  const FolderGridView({super.key, required this.folders, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350, mainAxisExtent: 150),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        final element = folders[index];
        return FolderLibaryView(element: element, onTap: onTap);
      },
    );
  }
}
