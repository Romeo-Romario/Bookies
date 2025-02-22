import 'package:bookies/pages/libary_page.dart';
import 'package:flutter/material.dart';
import 'package:bookies/pages/book_adding_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => LibaryPage(),
      '/adding': (contex) => BookAddingPage(),
    },
  ));
}
