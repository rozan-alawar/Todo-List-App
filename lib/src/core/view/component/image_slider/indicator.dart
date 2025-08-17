import 'package:flutter/material.dart';

import '../../../utils/const/sizes.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.count,
    required this.currentIndex,
    super.key,
    this.activeColor,
    this.backgroundColor,
  });

  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingH8, vertical: Sizes.paddingV8),
      child: Wrap(
        spacing: 5,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: List.generate(
          count,
          (index) {
            return Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.radius4),
                color: currentIndex == index ? activeColor : backgroundColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
