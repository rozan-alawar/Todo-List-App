import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.action,
  });
  final String title;
  final bool showBackButton;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showBackButton
            ? GestureDetector(
                onTap: () => context.pop(),
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(AppAssets.ASSETS_ICONS_ARROW_SVG),
                ),
              )
            : SizedBox.shrink(),
        Spacer(),
        Text(
          title,
          style: TextStyles.f20(context).copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        ...action ?? [],
      ],
    );
  }
}
