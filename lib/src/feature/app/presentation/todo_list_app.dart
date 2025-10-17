import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/env/flavor.dart';
import 'package:todo_list_app/src/core/config/theme/current_app_theme_provider.dart';
import 'package:todo_list_app/src/core/routing/app_route.dart';
import 'package:todo_list_app/src/core/routing/navigation_service.dart';
import 'package:todo_list_app/src/core/view/component/base/custom_toast.dart';

class TodoListApp extends HookConsumerWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(flavorProvider).appTitle;
    final themeMode = ref.watch(currentAppThemeModeProvider);
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: appTitle,
      routerConfig: router,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      theme: themeMode.getThemeData("LexendDeca"),
      builder: (_, child) {
        return GestureDetector(
          onTap: NavigationService.removeFocus,
          child: FToastOverlay(child: child!),
        );
      },
    );
  }
}
