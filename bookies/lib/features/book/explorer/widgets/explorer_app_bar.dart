import 'package:bookies/features/book/explorer/widgets/explorer_back_button.dart';
import 'package:bookies/features/book/explorer/widgets/explorer_title.dart';
import 'package:bookies/features/book/explorer/widgets/folder_detail_action_button.dart';
import 'package:bookies/features/book/explorer/widgets/statistic_action_button.dart';
import 'package:bookies/features/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class ExplorerAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const ExplorerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ExplorerTitle(),
      leading: ExplorerBackButton.nullIfRoot(context),
      centerTitle: true,
      backgroundColor: context.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      actions: [
        StatisticActionButton(),
        FolderDetailActionButton(),
      ],
    );
  }
}
