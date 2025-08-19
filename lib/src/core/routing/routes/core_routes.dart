part of '../app_route.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadePageRoute(pageKey: state.pageKey, child: const SplashScreen());
  }
}
