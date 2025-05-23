import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/count_info/count_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPageCountCard extends StatelessWidget {
  const TotalPageCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final info = context.select(
      (BookiesStatisticsCubit value) => value.state.totalPageCountInfo,
    );

    return CountCard(
      icon: Icons.library_books_outlined,
      title: info.title,
      count: info.count,
    );
  }
}
