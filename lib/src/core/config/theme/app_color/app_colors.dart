import 'dart:ui';

import 'package:flutter/material.dart';

import 'extensions_color.dart';

abstract class AppColors {
  Color get primary;

  Color get seedColor;

  Color get background;

  Color get error;

  Color get icon;

  Color get font;

  Color get expansionTileColor;

  Color get hintColor;

  Color get textFieldFieldColor;

  Color get textFieldFocusBorderColor;

  Color get textFieldPrefixIconColor;

  Color get textFieldSuffixIconColor;

  GradientColors get gradientColors;

  ButtonColors get customButtonColors;

  SwitcherColors get switcherColors;
}
