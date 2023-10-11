import 'package:auto_route/auto_route.dart';
import 'package:weatherapp/router/router.gr.dart';

@RoutePage(name: 'MainAppRouter')
class MainAppRouterPage extends AutoRouter {
  const MainAppRouterPage({super.key});
}

@RoutePage(name: 'WeatherMapRouter')
class WeatherMapRouterPage extends AutoRouter {
  const WeatherMapRouterPage({super.key});
}

/// Generate router code
/// dart run build_runner watch --delete-conflicting-outputs
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
        // RedirectRoute(path: '', redirectTo: 'weather-map'),
        AutoRoute(
          path: '',
          initial: true,
          page: HomeRoute.page,
          guards: const [],
          children: [
            AutoRoute(
              path: 'weather-map',
              page: WeatherMapRouter.page,
              children: [
                AutoRoute(path: '', page: WeatherMapRoute.page),
              ],
            ),
            AutoRoute(
              path: 'weather-city-finder',
              page: WeatherCityFinderRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}
