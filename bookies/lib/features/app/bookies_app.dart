import 'package:bookies/features/book/add/book_add_page.dart';
import 'package:bookies/features/explorer/bloc/explorer_bloc.dart';
import 'package:bookies/features/explorer/explorer_screen.dart';
import 'package:bookies/shared/theme/app_theme.dart';
import 'package:bookies/shared/theme/color_seed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BookiesApp extends StatelessWidget {
  const BookiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(mode: ThemeMode.light, seed: ColorSeed.baseColor);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) {
            return ExplorerBloc(
              explorerRepository: GetIt.I.get(),
              folderRepository: GetIt.I.get(),
            )..add(ExplorerStarted());
          },
        ),
      ],
      child: MaterialApp(
        // initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        themeMode: theme.mode,
        theme: theme.asLight(),
        darkTheme: theme.asDark(),
        routes: {
          '/': (context) => ExplorerScreen(),
          '/adding': (context) {
            final folderId = ModalRoute.of(context)!.settings.arguments as int?;
            return BookAddPage.create(folderId: folderId);
          },
        },
      ),
    );
  }
}
