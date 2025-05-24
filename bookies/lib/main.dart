import 'package:bookies/dependency/app_dependency_provider.dart';
import 'package:bookies/features/app/bookies_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDependencyProvider.init();

  runApp(const BookiesApp());
}
