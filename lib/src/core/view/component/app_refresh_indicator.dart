import 'package:flutter/material.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    required this.onRefresh,
    required this.slivers,
    this.enabled = true,
    super.key,
    this.widgetKey,
    this.scrollController,
    this.cacheExtent,
    this.sliverOverlapAbsorberHandle,
    // this.precedingSlivers,
    // this.precedingSliversHeight,
  });

  final Key? widgetKey;
  final bool enabled;
  final ScrollController? scrollController;
  final double? cacheExtent;
  final Future<void> Function() onRefresh;
  final List<Widget> slivers;
  // final List<Widget>? precedingSlivers;
  // final double? precedingSliversHeight;\
  final SliverOverlapAbsorberHandle? sliverOverlapAbsorberHandle;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widgetKey,
      notificationPredicate: enabled ? (_) => true : (_) => false,
      // color: appSwitcherColors(context).successColor,
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        cacheExtent: cacheExtent,
        controller: scrollController,
        slivers: [
          // if (precedingSlivers != null) ...precedingSlivers!,
          if (sliverOverlapAbsorberHandle != null)
            SliverOverlapInjector(handle: sliverOverlapAbsorberHandle!),
          ...slivers,
        ],
      ),
    );
  }
}
