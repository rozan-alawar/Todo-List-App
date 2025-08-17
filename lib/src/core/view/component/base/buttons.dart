import 'package:flutter/material.dart';

import '../../../config/theme/app_color/extensions_color.dart';
import '../../../config/theme/styles/styles.dart';
import '../../../utils/const/sizes.dart';
import 'indicator.dart';

enum AppButtonType {
  primary,
  primarySm,
  secondary,
  secondaryLight,
  danger,
  text,
  outline;

  Color buttonBGColor(BuildContext context) {
    final colors = appButtonsColors(context);
    return switch (this) {
      primary => colors.primaryButtonBGColor,
      primarySm => colors.primaryButtonBGColor,
      secondary => colors.secondaryButtonBGColor,
      danger => colors.dangerButtonBGColor,
      outline => Colors.transparent,
      text => Colors.transparent,
      secondaryLight => const Color(0xFFE7E8E9)
    };
  }

  Color? foregroundColor(BuildContext context) {
    final colors = appButtonsColors(context);
    return switch (this) {
      primary => colors.primaryButtonFGColor,
      primarySm => colors.primaryButtonFGColor,
      secondary => colors.secondaryButtonFGColor,
      danger => colors.dangerButtonFGColor,
      outline => colors.primaryButtonBGColor,
      text => colors.primaryButtonBGColor,
      secondaryLight => colors.secondaryButtonFGColor,
    };
  }

  TextStyle textStyle(
    BuildContext context,
  ) {
    return switch (this) {
      outline => TextStyles.f14(context),
      text => TextStyles.f16(context),
      _ => TextStyles.f14(context).semiBold,
    };
  }

  BorderSide border(BuildContext context, {Color? color}) {
    final colors = appButtonsColors(context);
    return switch (this) {
      outline => BorderSide(color: color ?? colors.primaryButtonBGColor),
      _ => BorderSide.none,
    };
  }

  EdgeInsetsGeometry padding() {
    const padding = EdgeInsets.symmetric(
      vertical: Sizes.buttonPaddingV14,
    );
    return switch (this) {
      outline || primarySm => const EdgeInsets.symmetric(
          horizontal: Sizes.buttonPaddingV10,
          vertical: Sizes.buttonPaddingV10,
        ),
      _ => padding,
    };
  }

  double roundCorner({double? roundCorner}) {
    return switch (this) {
      text => 0.0,
      _ => roundCorner ?? Sizes.buttonRadius8,
    };
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.type,
    required this.child,
    this.expanded = true,
    this.isLoading = false,
    this.disableButton = false,
    this.borderColor,
    this.roundCorner,
    super.key,
  });

  final VoidCallback? onPressed;
  final AppButtonType type;
  final Widget child;
  final bool expanded;
  final bool isLoading;
  final bool disableButton;
  final Color? borderColor;
  final double? roundCorner;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: !expanded ? null : const BoxConstraints(minWidth: double.infinity),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: appButtonsColors(context).disabledButtonBGColor,
          disabledForegroundColor: appButtonsColors(context).disabledButtonFGColor,
          surfaceTintColor: Colors.transparent,
          foregroundColor: type.foregroundColor(context),
          backgroundColor: type.buttonBGColor(context),
          elevation: type == AppButtonType.text ? 0.0 : null,
          textStyle: type.textStyle(context),
          padding: type.padding(),
          shape: RoundedRectangleBorder(
            side: disableButton ? BorderSide.none : type.border(context, color: borderColor),
            borderRadius: BorderRadius.circular(type.roundCorner(roundCorner: roundCorner)),
          ),
        ),
        onPressed: isLoading || disableButton ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: Sizes.paddingV16,
                width: Sizes.paddingV16,
                child: LoadingAppIndicator(),
              )
            : child,
      ),
    );
  }
}
