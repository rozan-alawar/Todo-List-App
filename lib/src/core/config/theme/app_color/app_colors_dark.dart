import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'custom_swatch_colors.dart';
import 'extensions_color.dart';

const _primary = Color(0xFF5F33E1);
const _background = Color(0xFF212B3D);
const _white = Color(0xFFFFFFFF);
const _danger = Color(0xFFEB5757);

class AppColorsDark implements AppColors {
  @override
  Color get primary => _primary;

  @override
  Color get seedColor => _primary;

  @override
  Color get background => _background;

  @override
  Color get error => _danger;

  @override
  Color get icon => _white;

  @override
  Color get font => _white;

  @override
  Color get expansionTileColor => const Color(0xFF0C1425);

  @override
  Color get textFieldFieldColor => const Color(0XFF181F2C);

  @override
  Color get textFieldFocusBorderColor => _primary;

  @override
  Color get hintColor => const Color(0xFF646972);

  @override
  Color get textFieldPrefixIconColor => _white;

  @override
  Color get textFieldSuffixIconColor => _neutralColors.shade300;

  @override
  ButtonColors get customButtonColors => _customButtonColors;

  @override
  GradientColors get gradientColors => AppGradientDark.gradientColors;

  @override
  SwitcherColors get switcherColors => const SwitcherColors(
    primaryColor: _primary,
    dangerColor: _danger,
    neutralColors: _neutralColors,
    primaryColors: _primaryColors,
    blueSwitch: _blueSwitch,
    bottomSheetBackground: _white,
    toastBGColor: Color(0xFF353535),
    warningColor: Color(0xFFF79009),
    successColor: Color(0xFF24DA5A),
  );
}

const _neutralColors = NeutralColors(0xFF424750, {
  40: Color(0xFF202632),
  50: _white,
  60: Color(0XFFE8E9EA),
  70: Color(0XFFB7BABE),
  80: Color(0XFF95989E),
  90: Color(0XFF262D3B),
  100: Color(0xFF8E98A8),
  200: Color(0xFFB6B8BB),
  300: Color(0xFF92959A),
  400: Color(0xFF61656C),
  500: Color(0xFF424750),
  600: Color(0xFF131924),
  700: Color(0xFF111721),
  800: Color(0xFF0D121A),
  900: Color(0xFF0A0E14),
});

const _blueSwitch = BlueColors(0xFF131924, {
  500: Color(0xFF131924),
  600: Color(0xFF0D192E),
  700: Color(0xFF050E1F),
  800: Color(0xFF0B1221),
  900: Color(0xFF080E19),
  1000: Color(0XFF161d2c),
});
final _customButtonColors = ButtonColors(
  primaryButtonBGColor: _primary,
  primaryButtonFGColor: _background,
  secondaryButtonBGColor: _neutralColors.shade600,
  secondaryButtonFGColor: _white,
  dangerButtonBGColor: _danger,
  dangerButtonFGColor: _white,
  txtButtonColor: _primary,
  disabledButtonBGColor: const Color(0xFFE7E8E9),
  disabledButtonFGColor: _neutralColors.shade400,
);

const _primaryColors = PrimaryColors(0xFF96CE2F, {
  50: Color(0xFF96CE2F),
  500: _primary,
});

class AppGradientDark {
  static LinearGradient get _scaffold => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.0, 1.0],
    colors: [_neutralColors.shade600, const Color(0xFF0D192E)],
  );
  static LinearGradient get cardLoginOrRegister => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      _blueSwitch.shade800.withOpacity(0.34),
      _blueSwitch.shade800.withOpacity(0.88),
      _blueSwitch.shade800.withOpacity(0.92),
      _blueSwitch.shade800,
      _blueSwitch.shade800,
    ],
  );

  static final gradientColors = GradientColors(
    scaffold: _scaffold,
    cardLoginOrRegister: cardLoginOrRegister,
  );
}
