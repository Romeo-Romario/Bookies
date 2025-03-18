import 'package:bookies/features/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';

sealed class TileStyle {
  static TextStyle? title(
    BuildContext context, {
    FontWeight? fontWeight,
    Color? color,
  }) {
    final style = context.textTheme.bodyLarge?.copyWith(
      color: color ?? context.colorScheme.secondary,
      fontWeight: fontWeight,
    );

    return style;
  }

  static TextStyle? subtitle(BuildContext context) {
    final style = context.textTheme.bodyMedium?.copyWith(
      color: subtitleColor(context),
    );

    return style;
  }

  static Color? subtitleColor(BuildContext context) {
    return context.theme.brightness == Brightness.dark
        ? Colors.grey[400]
        : Colors.grey[600];
  }
}
