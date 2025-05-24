import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/book/explorer/widgets/explorer_app_bar.dart';
import 'package:bookies/features/book/explorer/widgets/explorer_book_grid_view.dart';
import 'package:bookies/features/book/explorer/widgets/explorer_fab.dart';
import 'package:bookies/features/book/explorer/widgets/explorer_folder_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRootFolder = context.select(
      (ExplorerBloc value) => value.state.isRootFolder,
    );

    return PopScope(
      canPop: isRootFolder,
      onPopInvokedWithResult: (didPop, result) {
        final bloc = context.read<ExplorerBloc>();

        bloc.add(ExplorerNavigateBackRequested());
      },
      child: Scaffold(
        appBar: ExplorerAppBar(),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExplorerFab(),
        body: ListView(
          children: [
            ExplorerFolderGridView(),
            ExplorerBookGridView(),
          ],
        ),
      ),
    );
  }
}
