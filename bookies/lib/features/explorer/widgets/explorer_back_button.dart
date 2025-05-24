import 'package:bookies/features/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorerBackButton extends StatelessWidget {
  const ExplorerBackButton._();

  static ExplorerBackButton? nullIfRoot(BuildContext context) {
    final isRootFolder = context.select(
      (ExplorerBloc value) => value.state.isRootFolder,
    );

    if (isRootFolder) {
      return null;
    }

    return ExplorerBackButton._();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bloc = context.read<ExplorerBloc>();

        bloc.add(ExplorerNavigateBackRequested());
      },
      icon: Icon(
        Icons.arrow_back,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
