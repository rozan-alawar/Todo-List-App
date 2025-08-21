part of '../app_route.dart';

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: [TypedGoRoute<RegisterRoute>(path: 'register')],
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadePageRoute(pageKey: state.pageKey, child: const RegisterScreen());
}
