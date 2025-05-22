import 'dart:math' as math;

import 'package:flutter/material.dart';

sealed class ColorTool {
  static final _random = math.Random();

  static Color random() => randomV2();

  static Color randomV1() {
    return Color((_random.nextDouble() * 0xFFFFFF).toInt()).withAlpha(255);
  }

  static Color randomV2() {
    return Colors.primaries[_random.nextInt(Colors.primaries.length)];
  }

  static Color contrastFrom(Color color) {
    Color contrast =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return contrast;
  }
}
