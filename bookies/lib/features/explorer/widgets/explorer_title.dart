import 'package:bookies/features/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorerTitle extends StatelessWidget {
  const ExplorerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final exploredName = context.select(
      (ExplorerBloc value) => value.state.exploredName,
    );

    return Text(
      exploredName,
      style: TextStyle(
        color: context.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
