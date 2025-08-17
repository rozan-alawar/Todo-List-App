import 'package:flutter/cupertino.dart';

import '../../config/theme/app_color/extensions_color.dart';
import '../../utils/const/sizes.dart';

class ListBottomError extends StatelessWidget {
  const ListBottomError({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.paddingV12),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(
            CupertinoIcons.restart,
            size: 32,
            // color: appSwitcherColors(context).neutralColors.shade600,
          ),
        ),
      ),
    );
  }
}
