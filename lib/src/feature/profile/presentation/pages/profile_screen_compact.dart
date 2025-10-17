import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/theme/styles/styles.dart';
import 'package:todo_list_app/src/core/extentions/space_extention.dart';
import 'package:todo_list_app/src/core/extentions/when_ex.dart';
import 'package:todo_list_app/src/core/gen/app_assets.dart';
import 'package:todo_list_app/src/core/utils/const/sizes.dart';
import 'package:todo_list_app/src/core/view/component/base/buttons.dart';
import 'package:todo_list_app/src/core/view/component/base/indicator.dart';
import 'package:todo_list_app/src/core/view/component/base/safe_scaffold.dart';
import 'package:todo_list_app/src/feature/auth/domain/user_app_model.dart';
import 'package:todo_list_app/src/feature/auth/presentation/providers/auth_providers.dart';
import 'package:todo_list_app/src/feature/auth/presentation/screens/login_screen.dart';
import 'package:todo_list_app/src/feature/home/presentation/components/custom_app_bar.dart';

class ProfileScreenCompact extends HookConsumerWidget {
  const ProfileScreenCompact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(loginStateProvider);

    return SafeScaffold(
      safeTop: true,
      body: authState.whenSuccessInSliver(
        onRetry: () => ref.refresh(loginStateProvider),
        data: (userOption) => userOption.fold(
          () => _buildNoUserView(context),
          (userData) => _buildUserProfileView(context, userData.user, ref),
        ),
        loading: () => const Center(child: LoadingAppIndicator()),
        error: (error, stackTrace) => _buildErrorView(context, error),
      ),
    );
  }

  Widget _buildNoUserView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please log in to view your profile',
            style: TextStyles.f16(context),
          ),
          20.height,
          AppButton(
            onPressed: () {
              // TODO: Navigate to login screen
              // context.go('/login');
            },
            type: AppButtonType.primary,
            child: Text('Log In'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfileView(
    BuildContext context,
    UserApp userData,
    WidgetRef ref,
  ) {
    // final isLoading = ref.watch(
    //   logoutStateProvider.select((value) => value.isLoading),
    // );
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomAppBar(title: "Profile", showBackButton: true),
                const SizedBox(height: Sizes.paddingH24),

                CircleAvatar(
                  radius: 80,
                  backgroundImage: userData.imageUrl.isEmpty
                      ? AssetImage(AppAssets.ASSETS_IMAGES_USER_PLACEHOLDER_PNG)
                      : NetworkImage(userData.imageUrl),
                  onBackgroundImageError: (_, __) => const Icon(Icons.person),
                ),
                20.height,

                // User Name
                Text(
                  userData.fullName,
                  style: TextStyles.f24(
                    context,
                  ).copyWith(fontWeight: FontStyles.fontWeightBold),
                ),
                10.height,

                // Email
                Text(
                  userData.email,
                  style: TextStyles.f16(
                    context,
                  ).copyWith(color: Colors.grey[600]),
                ),
                20.height,

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildProfileDetailRow(
                          context,
                          icon: Icons.phone,
                          label: 'Phone Number',
                          value: userData.phone ?? 'Not provided',
                        ),
                        const Divider(),
                        _buildProfileDetailRow(
                          context,
                          icon: Icons.email_outlined,
                          label: 'Email Address',
                          value: userData.email,
                        ),
                      ],
                    ),
                  ),
                ),
                30.height,
                AppButton(
                  isLoading: ref.watch(
                    logoutStateProvider.select((value) => value.isLoading),
                  ),
                  onPressed: () async {
                    await ref.read(logoutStateProvider.notifier).logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  type: AppButtonType.primary,

                  child: Text(
                    'Logout',
                    style: TextStyles.f14(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          15.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.f14(
                  context,
                ).copyWith(color: Colors.grey[600]),
              ),
              Text(
                value,
                style: TextStyles.f16(
                  context,
                ).copyWith(fontWeight: FontStyles.fontWeightMedium),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred',
            style: TextStyles.f18(context).copyWith(color: Colors.red),
          ),
          10.height,
          Text(
            error.toString(),
            style: TextStyles.f14(context),
            textAlign: TextAlign.center,
          ),
          20.height,
          AppButton(
            onPressed: () {
              // TODO: Implement retry logic or refresh
            },
            type: AppButtonType.primary,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
