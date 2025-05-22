import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/count_info/count_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkCountCard extends StatelessWidget {
  const BookmarkCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final info = context.select(
      (BookiesStatisticsCubit value) => value.state.bookmarkCountInfo,
    );

    return CountCard(
      icon: Icons.bookmark_outline,
      title: info.title,
      count: info.count,
    );
  }
}
