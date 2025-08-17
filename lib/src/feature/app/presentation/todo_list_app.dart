import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list_app/src/core/config/env/flavor.dart';
import 'package:todo_list_app/src/core/config/theme/current_app_theme_provider.dart';
import 'package:todo_list_app/src/feature/intro/presentation/screens/splash_screen.dart';

class TodoListApp extends HookConsumerWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(flavorProvider).appTitle;
    final themeMode = ref.watch(currentAppThemeModeProvider);

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: themeMode.getThemeData("LexendDeca"),
      home: SplashScreen(),
    );
  }
}
