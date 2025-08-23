import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';

class SplashScreenCompact extends StatelessWidget {
  const SplashScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      safeTop: true,
      body: Column(
        children: [
          Image.asset(
            AppAssets.ASSETS_IMAGES_SPLASH_PNG,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Spacer(),
          Text(
            'Task Management &\n To-Do List',
            textAlign: TextAlign.center,

            style: TextStyles.f24(
              context,
            ).copyWith(fontWeight: FontStyles.fontWeightBold),
          ),
          30.height,

          Text(
            "This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!",
            textAlign: TextAlign.center,

            style: TextStyles.f14(context),
          ),
          40.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              onPressed: () => context.go('/login'),
              roundCorner: 16,
              type: AppButtonType.primary,
              child: Text(
                'Let’s Start',
                style: TextStyles.f16(context).copyWith(
                  fontWeight: FontStyles.fontWeightMedium,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          60.height,
        ],
      ),
    );
  }
}
