import 'package:flutter/material.dart';
import 'platform_helper.dart';

enum WindowSizeResponsive {
  compact(0),
  medium(600),
  expanded(840);

  const WindowSizeResponsive(this.breakpoint);

  final double breakpoint;

  static WindowSizeResponsive determineWindowClass(Size size) {
    final deviceWidth = PlatformHelper.isDesktopDeviceOrWeb ? size.width : size.shortestSide;

    if (deviceWidth >= WindowSizeResponsive.expanded.breakpoint) {
      return WindowSizeResponsive.expanded;
    }
    if (deviceWidth >= WindowSizeResponsive.medium.breakpoint) {
      return WindowSizeResponsive.medium;
    }
    return WindowSizeResponsive.compact;
  }
}

class WindowClassLayout extends StatelessWidget {
  const WindowClassLayout({
    required this.compact,
    super.key,
    this.medium,
    this.expanded,
  });

  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final windowClass = WindowSizeResponsive.determineWindowClass(size);

        if (windowClass == WindowSizeResponsive.expanded) {
          if (expanded != null) return expanded!(context);
          if (medium != null) return medium!(context);
        }

        if (windowClass == WindowSizeResponsive.medium) {
          if (medium != null) return medium!(context);
        }

        return compact(context);
      },
    );
  }
}

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    required this.portrait,
    super.key,
    this.landscape,
  });

  final WidgetBuilder portrait;
  final WidgetBuilder? landscape;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape && landscape != null) {
          return landscape!(context);
        }

        return portrait(context);
      },
    );
  }
}
