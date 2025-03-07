import 'package:bookies/pages/libary_page.dart';
import 'package:bookies/services/modules/adding_page_view/models/image_saver.dart';
import 'package:bookies/services/shared/initialization_functions/db_built_in_entities_initializer.dart';
import 'package:flutter/material.dart';
import 'package:bookies/pages/book_adding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  builtInEntitiesInitializer();
  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {
      '/': (context) => LibaryPage(),
      '/adding': (contex) => BookAddingPage(),
    },
  ));
}
