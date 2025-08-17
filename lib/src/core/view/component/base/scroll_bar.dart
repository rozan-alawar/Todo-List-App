import 'package:flutter/material.dart';

class AppScrollBar extends StatelessWidget {
  const AppScrollBar({
    required this.child,
    super.key,
    this.controller,
    this.scrollbarOrientation,
  });

  final Widget child;
  final ScrollController? controller;
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: true,
      trackVisibility: true,
      scrollbarOrientation: scrollbarOrientation,
      thickness: 7,
      child: child,
    );
  }
}
