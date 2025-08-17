import 'package:flutter/material.dart';

import 'custom_swatch_colors.dart';

GradientColors appGradientColors(BuildContext context) =>
    Theme.of(context).extension<GradientColors>()!;

SwitcherColors appSwitcherColors(BuildContext context) =>
    Theme.of(context).extension<SwitcherColors>()!;

ButtonColors appButtonsColors(BuildContext context) =>
    Theme.of(context).extension<ButtonColors>()!;

class ButtonColors extends ThemeExtension<ButtonColors> {
  ButtonColors({
    required this.primaryButtonBGColor,
    required this.primaryButtonFGColor,
    required this.secondaryButtonBGColor,
    required this.secondaryButtonFGColor,
    required this.dangerButtonBGColor,
    required this.dangerButtonFGColor,
    required this.disabledButtonBGColor,
    required this.disabledButtonFGColor,
    required this.txtButtonColor,
  });

  final Color primaryButtonBGColor;
  final Color primaryButtonFGColor;

  final Color secondaryButtonBGColor;
  final Color secondaryButtonFGColor;

  final Color dangerButtonBGColor;
  final Color dangerButtonFGColor;

  final Color txtButtonColor;

  final Color disabledButtonBGColor;
  final Color disabledButtonFGColor;

  @override
  ThemeExtension<ButtonColors> copyWith() {
    return ButtonColors(
      primaryButtonBGColor: primaryButtonBGColor,
      primaryButtonFGColor: primaryButtonFGColor,
      secondaryButtonBGColor: secondaryButtonBGColor,
      secondaryButtonFGColor: secondaryButtonFGColor,
      dangerButtonBGColor: dangerButtonBGColor,
      dangerButtonFGColor: dangerButtonFGColor,
      disabledButtonBGColor: disabledButtonBGColor,
      disabledButtonFGColor: disabledButtonFGColor,
      txtButtonColor: txtButtonColor,
    );
  }

  @override
  ThemeExtension<ButtonColors> lerp(
    covariant ThemeExtension<ButtonColors>? other,
    double t,
  ) {
    if (other is! ButtonColors) {
      return copyWith();
    }
    return ButtonColors(
      primaryButtonBGColor: Color.lerp(
        primaryButtonBGColor,
        other.primaryButtonBGColor,
        t,
      )!,
      primaryButtonFGColor: Color.lerp(
        primaryButtonFGColor,
        other.primaryButtonFGColor,
        t,
      )!,
      secondaryButtonBGColor: Color.lerp(
        secondaryButtonBGColor,
        other.secondaryButtonBGColor,
        t,
      )!,
      secondaryButtonFGColor: Color.lerp(
        secondaryButtonFGColor,
        other.secondaryButtonFGColor,
        t,
      )!,
      dangerButtonBGColor: Color.lerp(
        dangerButtonBGColor,
        other.dangerButtonBGColor,
        t,
      )!,
      dangerButtonFGColor: Color.lerp(
        dangerButtonFGColor,
        other.dangerButtonFGColor,
        t,
      )!,
      disabledButtonBGColor: Color.lerp(
        disabledButtonBGColor,
        other.disabledButtonBGColor,
        t,
      )!,
      disabledButtonFGColor: Color.lerp(
        disabledButtonFGColor,
        other.disabledButtonFGColor,
        t,
      )!,
      txtButtonColor: Color.lerp(txtButtonColor, other.txtButtonColor, t)!,
    );
  }
}

class GradientColors extends ThemeExtension<GradientColors> {
  GradientColors({required this.scaffold, required this.cardLoginOrRegister});
  final LinearGradient scaffold;
  final LinearGradient cardLoginOrRegister;

  @override
  ThemeExtension<GradientColors> copyWith() {
    return GradientColors(
      scaffold: scaffold,
      cardLoginOrRegister: cardLoginOrRegister,
    );
  }

  @override
  ThemeExtension<GradientColors> lerp(
    covariant ThemeExtension<GradientColors>? other,
    double t,
  ) {
    if (other is! GradientColors) {
      return copyWith();
    }
    return GradientColors(
      scaffold: LinearGradient.lerp(scaffold, other.scaffold, t)!,
      cardLoginOrRegister: LinearGradient.lerp(
        cardLoginOrRegister,
        other.cardLoginOrRegister,
        t,
      )!,
    );
  }
}

class SwitcherColors extends ThemeExtension<SwitcherColors> {
  const SwitcherColors({
    required this.primaryColor,
    required this.dangerColor,
    required this.neutralColors,
    required this.warningColor,
    required this.toastBGColor,
    required this.successColor,
    required this.primaryColors,
    required this.blueSwitch,
    required this.bottomSheetBackground,
  });

  final Color primaryColor;
  final Color dangerColor;
  final Color warningColor;
  final Color successColor;
  final Color toastBGColor;
  final Color bottomSheetBackground;
  final NeutralColors neutralColors;
  final PrimaryColors primaryColors;
  final BlueColors blueSwitch;

  @override
  ThemeExtension<SwitcherColors> copyWith() {
    return SwitcherColors(
      primaryColor: primaryColor,
      dangerColor: dangerColor,
      neutralColors: neutralColors,
      warningColor: warningColor,
      toastBGColor: toastBGColor,
      successColor: successColor,
      primaryColors: primaryColors,
      blueSwitch: blueSwitch,
      bottomSheetBackground: bottomSheetBackground,
    );
  }

  @override
  ThemeExtension<SwitcherColors> lerp(
    covariant ThemeExtension<SwitcherColors>? other,
    double t,
  ) {
    if (other is! SwitcherColors) {
      return copyWith();
    }
    return SwitcherColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      dangerColor: Color.lerp(dangerColor, other.dangerColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      toastBGColor: Color.lerp(toastBGColor, other.toastBGColor, t)!,
      neutralColors: NeutralColors(
        Color.lerp(
          neutralColors.shade500,
          other.neutralColors.shade500,
          t,
        )!.value,
        <int, Color>{
          40: Color.lerp(
            neutralColors.shade40,
            other.neutralColors.shade40,
            t,
          )!,
          50: Color.lerp(
            neutralColors.shade50,
            other.neutralColors.shade50,
            t,
          )!,
          60: Color.lerp(
            neutralColors.shade60,
            other.neutralColors.shade60,
            t,
          )!,
          70: Color.lerp(
            neutralColors.shade70,
            other.neutralColors.shade70,
            t,
          )!,
          80: Color.lerp(
            neutralColors.shade80,
            other.neutralColors.shade80,
            t,
          )!,
          90: Color.lerp(
            neutralColors.shade90,
            other.neutralColors.shade90,
            t,
          )!,
          100: Color.lerp(
            neutralColors.shade100,
            other.neutralColors.shade100,
            t,
          )!,
          200: Color.lerp(
            neutralColors.shade200,
            other.neutralColors.shade200,
            t,
          )!,
          300: Color.lerp(
            neutralColors.shade300,
            other.neutralColors.shade300,
            t,
          )!,
          400: Color.lerp(
            neutralColors.shade400,
            other.neutralColors.shade400,
            t,
          )!,
          500: Color.lerp(
            neutralColors.shade500,
            other.neutralColors.shade500,
            t,
          )!,
          600: Color.lerp(
            neutralColors.shade600,
            other.neutralColors.shade600,
            t,
          )!,
          700: Color.lerp(
            neutralColors.shade700,
            other.neutralColors.shade700,
            t,
          )!,
          800: Color.lerp(
            neutralColors.shade800,
            other.neutralColors.shade800,
            t,
          )!,
          900: Color.lerp(
            neutralColors.shade900,
            other.neutralColors.shade900,
            t,
          )!,
        },
      ),
      primaryColors: PrimaryColors(
        Color.lerp(
          primaryColors.shade500,
          other.primaryColors.shade500,
          t,
        )!.value,
        <int, Color>{
          50: Color.lerp(
            primaryColors.shade50,
            other.primaryColors.shade50,
            t,
          )!,
          500: Color.lerp(
            primaryColors.shade500,
            other.primaryColors.shade500,
            t,
          )!,
        },
      ),
      blueSwitch: BlueColors(
        Color.lerp(blueSwitch.shade500, other.blueSwitch.shade500, t)!.value,
        <int, Color>{
          500: Color.lerp(blueSwitch.shade500, other.blueSwitch.shade500, t)!,
          600: Color.lerp(blueSwitch.shade600, other.blueSwitch.shade600, t)!,
          700: Color.lerp(blueSwitch.shade700, other.blueSwitch.shade700, t)!,
          800: Color.lerp(blueSwitch.shade800, other.blueSwitch.shade800, t)!,
          900: Color.lerp(blueSwitch.shade900, other.blueSwitch.shade900, t)!,
          1000: Color.lerp(
            blueSwitch.shade1000,
            other.blueSwitch.shade1000,
            t,
          )!,
        },
      ),
      bottomSheetBackground: Color.lerp(
        bottomSheetBackground,
        other.bottomSheetBackground,
        t,
      )!,
    );
  }
}
