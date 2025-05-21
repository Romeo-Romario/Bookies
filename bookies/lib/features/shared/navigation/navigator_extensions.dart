import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  Future<T?> push<T>(WidgetBuilder builder) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: builder));
  }
}
