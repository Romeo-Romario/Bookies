import 'package:bookies/features/statistics/cubit/bookies_statistics_cubit.dart';
import 'package:bookies/features/statistics/widgets/count_info/count_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCountCard extends StatelessWidget {
  const BookCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final info = context.select(
      (BookiesStatisticsCubit value) => value.state.bookCountInfo,
    );

    return CountCard(
      icon: Icons.book_outlined,
      title: info.title,
      count: info.count,
    );
  }
}
