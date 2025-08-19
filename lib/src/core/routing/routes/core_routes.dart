part of '../app_route.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadePageRoute(pageKey: state.pageKey, child: const SplashScreen());
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: [TypedGoRoute<AddTaskRoute>(path: 'add-task')],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadePageRoute(pageKey: state.pageKey, child: const HomeScreen());
  }
}

class AddTaskRoute extends GoRouteData {
  const AddTaskRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadePageRoute(pageKey: state.pageKey, child: const AddTaskScreen());
  }
}
