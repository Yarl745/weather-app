import 'package:auto_route/auto_route.dart';
import 'package:weatherapp/router/router.gr.dart';
import 'package:weatherapp/router/router_guards.dart';

@RoutePage(name: 'MainAppRouter')
class MainAppRouterPage extends AutoRouter {
  const MainAppRouterPage({super.key});
}

@RoutePage(name: 'AuthRouter')
class AuthRouterPage extends AutoRouter {
  const AuthRouterPage({super.key});
}

/// Generate router code
/// flutter pub run build_runner watch --delete-conflicting-outputs
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: MainAppRouter.page,
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(
          path: 'onboarding',
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          path: 'auth',
          page: AuthRouter.page,
          guards: [OnboardingGuard()],
          children: [
            AutoRoute(path: '', page: MainAuthRoute.page),
            AutoRoute(path: 'create-account', page: CreateAccountRoute.page),
            // AutoRoute(path: 'login', page: MainAuthRoute.page),
          ],
        ),
        AutoRoute(
          path: 'home',
          page: HomeRoute.page,
          guards: [AuthGuard()],
        ),
      ],
    ),
  ];
}
