import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_app/src/feature/intro/presentation/screens/splash_screen.dart';

import '../../feature/auth/presentation/screens/login_screen.dart';
import 'util/navigation_transitions.dart';

part 'app_route.g.dart';
part 'routes/auth_routs.dart';
part 'routes/core_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  final listenToRefresh = ValueNotifier<bool?>(null);

  final appRouter = GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: $appRoutes,
    refreshListenable: listenToRefresh,
  );

  ref.onDispose(() {
    listenToRefresh.dispose();
    appRouter.dispose();
  });

  return appRouter;
}
