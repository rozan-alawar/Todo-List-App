import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/const/sizes.dart';
import 'app_color/app_colors.dart';
import 'app_color/app_colors_dark.dart';
import 'app_color/app_colors_light.dart';
import 'app_color/extensions_color.dart';
import 'styles/styles.dart';

enum AppThemeMode {
  light,
  dark;

  const AppThemeMode();

  ThemeData get _baseTheme {
    return switch (this) {
      AppThemeMode.light => ThemeData.light(),
      AppThemeMode.dark => ThemeData.dark(),
    };
  }

  AppColors get _colorsPalette {
    return switch (this) {
      AppThemeMode.light => AppColorsLight(),
      AppThemeMode.dark => AppColorsDark(),
    };
  }

  Brightness get _colorSchemeBrightness {
    return switch (this) {
      AppThemeMode.light => Brightness.light,
      AppThemeMode.dark => Brightness.dark,
    };
  }

  ThemeData getThemeData(String fontFamily) {
    return AppTheme(themeMode: this).getThemeData(fontFamily);
  }
}

class AppTheme {
  AppTheme({required AppThemeMode themeMode}) : _themeMode = themeMode;

  final AppThemeMode _themeMode;

  late final ThemeData _baseTheme = _themeMode._baseTheme;

  late final Brightness _colorSchemeBrightness =
      _themeMode._colorSchemeBrightness;

  late final AppColors _appColors = _themeMode._colorsPalette;

  late final Color _primary = _appColors.primary;

  late final Color _background = _appColors.background;

  late final Color _scaffoldBackgroundColor = _appColors.background;

  late final ButtonColors _customButtonColors = _appColors.customButtonColors;

  late final GradientColors _gradientColors = _appColors.gradientColors;

  late final SwitcherColors _switcherColors = _appColors.switcherColors;

  late final _inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    filled: true,
    errorMaxLines: 2,
    fillColor: _appColors.textFieldFieldColor,
    suffixIconColor: _appColors.textFieldSuffixIconColor,
    prefixIconColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.focused)
          ? _appColors.textFieldFocusBorderColor
          : _appColors.textFieldPrefixIconColor,
    ),
    hintStyle: TextStyles.inputDecorationHint(_appColors.hintColor),
    errorStyle: TextStyles.inputDecorationError(_appColors.error),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Sizes.textFieldPaddingH16,
      vertical: Sizes.textFieldPaddingV14,
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.textFieldRadius8)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(Sizes.textFieldRadius8)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _appColors.error),
      borderRadius:
          const BorderRadius.all(Radius.circular(Sizes.textFieldRadius8)),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(Sizes.textFieldRadius8)),
    ),
  );

  late final _checkboxTheme = CheckboxThemeData(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.checkboxRadius4)),
    ),
    side: BorderSide(color: _appColors.switcherColors.neutralColors.shade60),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _appColors.primary;
      }
      return null;
    }),
  );

  late final NavigationBarThemeData _navigationBarTheme =
      NavigationBarThemeData(
    height: 60,
    backgroundColor: const Color(0xFF061126),
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    overlayColor: WidgetStateProperty.resolveWith((states) {
      return Colors.transparent;
    }),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: _appColors.primary, size: 24);
      }
      return IconThemeData(color: _appColors.font.withOpacity(0.7), size: 24);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyles.navigationLabel(_appColors.primary).medium;
      }
      return TextStyles.navigationLabel(_appColors.font.withOpacity(0.7));
    }),
    elevation: 0,
  );

  late final expansionTileThemeData = ExpansionTileThemeData(
    textColor: _appColors.font,
    iconColor: _appColors.primary,
    collapsedTextColor: _appColors.font,
    expandedAlignment: Alignment.topRight,
    collapsedIconColor: _appColors.primary,
    backgroundColor: _appColors.expansionTileColor,
    collapsedBackgroundColor: _appColors.expansionTileColor,
    tilePadding: const EdgeInsets.symmetric(
      horizontal: Sizes.paddingH16,
    ),
    expansionAnimationStyle: const AnimationStyle(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      reverseCurve: Curves.easeInOutCubic,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.radius8),
      side: const BorderSide(color: Colors.transparent),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.radius8),
      side: const BorderSide(color: Colors.transparent),
    ),
    childrenPadding: const EdgeInsets.symmetric(
      horizontal: Sizes.paddingH16,
      vertical: Sizes.paddingV24,
    ),
  );

  ThemeData getThemeData(String fontFamily) {
    return _baseTheme.copyWith(
      textTheme: _colorSchemeBrightness.toTypography(fontFamily),
      colorScheme: ColorScheme.fromSeed(
        brightness: _colorSchemeBrightness,
        seedColor: _primary,
        primary: _primary,
        surface: _background,
        error: _appColors.error,
        onError: _appColors.font,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0XFFF0F0F0),
      ),
      // dialogTheme: DialogTheme(
      //   backgroundColor: _appColors.font,
      //   surfaceTintColor: Colors.transparent,
      //   titleTextStyle: TextStyles.listTitle(_appColors.switcherColors.neutralColors.shade900)
      //       .copyWith(fontFamily: fontFamily),
      //   contentTextStyle: TextStyles.subListTitle(_appColors.switcherColors.neutralColors.shade900)
      //       .copyWith(fontFamily: fontFamily),
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(Sizes.radius8)),
      //   ),
      // ),
      navigationBarTheme: _navigationBarTheme,
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        brightness: _colorSchemeBrightness,
        primaryColor: _primary,
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        applyThemeToAll: true,
      ),
      checkboxTheme: _checkboxTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF090F17),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: _appColors.icon),
        titleTextStyle: TextStyles.appBarTitle(_appColors.font)
            .copyWith(fontFamily: fontFamily),
      ),
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      inputDecorationTheme: _inputDecorationTheme,
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: Colors.transparent,
        color: _appColors.switcherColors.neutralColors.shade50,
        textStyle: TextStyles.listTitle(
                _appColors.switcherColors.neutralColors.shade900)
            .copyWith(fontFamily: fontFamily),
        labelTextStyle:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          return TextStyles.listTitle(
                  _appColors.switcherColors.neutralColors.shade900)
              .copyWith(fontFamily: fontFamily);
        }),
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.radius8),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: _appColors.icon,
        textColor: _appColors.font,
        titleTextStyle: TextStyles.listTitle(_appColors.font)
            .copyWith(fontFamily: fontFamily),
        subtitleTextStyle: TextStyles.subListTitle(
                _appColors.switcherColors.neutralColors.shade400)
            .copyWith(fontFamily: fontFamily),
      ),
      expansionTileTheme: expansionTileThemeData,
      extensions: [_customButtonColors, _gradientColors, _switcherColors],
    );
  }
}

extension on Brightness {
  TextTheme toTypography(String fontFamily) {
    return (this == Brightness.dark ? Typography().white : Typography().black)
        .apply(fontFamily: fontFamily);
  }
}
