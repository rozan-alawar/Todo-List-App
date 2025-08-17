import 'package:flutter/material.dart';

import '../../../config/theme/app_color/extensions_color.dart';

class SafeScaffold extends StatelessWidget {
  const SafeScaffold({
    required this.body,
    this.appBar,
    this.safeTop = true,
    this.safeBottom = true,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
    this.useGradient = true,
    this.persistentFooterButtons,
    this.color,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool safeTop;
  final bool safeBottom;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  final bool useGradient;
  final Color? color;
  final List<Widget>? persistentFooterButtons;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: useGradient ? appGradientColors(context).scaffold : null,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: SafeArea(
          maintainBottomViewPadding: true,
          top: safeTop,
          bottom: safeBottom,
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBar,
        persistentFooterButtons: persistentFooterButtons,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
