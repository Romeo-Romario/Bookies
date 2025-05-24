import 'package:bookies/features/book/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/book/explorer/widgets/add_first_entity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFirstFolderOrBookCard extends StatelessWidget {
  const AddFirstFolderOrBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    final id = context.read<ExplorerBloc>().state.exploredId;

    return Center(
      child: AddFirstEntityCard(
        icon: Icons.create_new_folder_outlined,
        title: 'Tap to add your first folder or book',
        onTap: () {
          // ExplorerEntityEditor.show(context: context, parentFolder: id);
        },
      ),
    );
  }
}
