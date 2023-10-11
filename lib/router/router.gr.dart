// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:weatherapp/presentation/auth/create_account_page.dart' as _i1;
import 'package:weatherapp/presentation/auth/main_auth_page.dart' as _i4;
import 'package:weatherapp/presentation/home/home_page.dart' as _i2;
import 'package:weatherapp/presentation/onboarding/onboarding_page.dart' as _i5;
import 'package:weatherapp/presentation/weather_city_finder/weather_city_finder_page.dart'
    as _i6;
import 'package:weatherapp/presentation/weather_map/weather_map_page.dart'
    as _i7;
import 'package:weatherapp/router/router.dart' as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CreateAccountRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateAccountPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MainAppRouter.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainAppRouterPage(),
      );
    },
    MainAuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainAuthPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingPage(),
      );
    },
    WeatherCityFinderRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WeatherCityFinderPage(),
      );
    },
    WeatherMapRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WeatherMapPage(),
      );
    },
    WeatherMapRouter.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WeatherMapRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateAccountPage]
class CreateAccountRoute extends _i8.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainAppRouterPage]
class MainAppRouter extends _i8.PageRouteInfo<void> {
  const MainAppRouter({List<_i8.PageRouteInfo>? children})
      : super(
          MainAppRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainAppRouter';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainAuthPage]
class MainAuthRoute extends _i8.PageRouteInfo<void> {
  const MainAuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAuthRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WeatherCityFinderPage]
class WeatherCityFinderRoute extends _i8.PageRouteInfo<void> {
  const WeatherCityFinderRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WeatherCityFinderRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherCityFinderRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WeatherMapPage]
class WeatherMapRoute extends _i8.PageRouteInfo<void> {
  const WeatherMapRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WeatherMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherMapRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WeatherMapRouterPage]
class WeatherMapRouter extends _i8.PageRouteInfo<void> {
  const WeatherMapRouter({List<_i8.PageRouteInfo>? children})
      : super(
          WeatherMapRouter.name,
          initialChildren: children,
        );

  static const String name = 'WeatherMapRouter';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
