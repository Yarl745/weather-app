// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart'
    as _i8;
import 'package:weatherapp/presentation/home/home_page.dart' as _i3;
import 'package:weatherapp/presentation/weather_city_finder/city_forecast_page.dart'
    as _i1;
import 'package:weatherapp/presentation/weather_city_finder/city_search_page.dart'
    as _i2;
import 'package:weatherapp/presentation/weather_map/weather_map_page.dart'
    as _i5;
import 'package:weatherapp/router/router.dart' as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CityForecastRoute.name: (routeData) {
      final args = routeData.argsAs<CityForecastRouteArgs>(
          orElse: () => const CityForecastRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CityForecastPage(
          key: args.key,
          cityWeatherForecast: args.cityWeatherForecast,
        ),
      );
    },
    CitySearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CitySearchPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MainAppRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainAppRouterPage(),
      );
    },
    WeatherCityFinderRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WeatherCityFinderRouterPage(),
      );
    },
    WeatherMapRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WeatherMapPage(),
      );
    },
    WeatherMapRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WeatherMapRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CityForecastPage]
class CityForecastRoute extends _i6.PageRouteInfo<CityForecastRouteArgs> {
  CityForecastRoute({
    _i7.Key? key,
    _i8.CityWeatherForecast? cityWeatherForecast,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CityForecastRoute.name,
          args: CityForecastRouteArgs(
            key: key,
            cityWeatherForecast: cityWeatherForecast,
          ),
          initialChildren: children,
        );

  static const String name = 'CityForecastRoute';

  static const _i6.PageInfo<CityForecastRouteArgs> page =
      _i6.PageInfo<CityForecastRouteArgs>(name);
}

class CityForecastRouteArgs {
  const CityForecastRouteArgs({
    this.key,
    this.cityWeatherForecast,
  });

  final _i7.Key? key;

  final _i8.CityWeatherForecast? cityWeatherForecast;

  @override
  String toString() {
    return 'CityForecastRouteArgs{key: $key, cityWeatherForecast: $cityWeatherForecast}';
  }
}

/// generated route for
/// [_i2.CitySearchPage]
class CitySearchRoute extends _i6.PageRouteInfo<void> {
  const CitySearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CitySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitySearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainAppRouterPage]
class MainAppRouter extends _i6.PageRouteInfo<void> {
  const MainAppRouter({List<_i6.PageRouteInfo>? children})
      : super(
          MainAppRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainAppRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeatherCityFinderRouterPage]
class WeatherCityFinderRouter extends _i6.PageRouteInfo<void> {
  const WeatherCityFinderRouter({List<_i6.PageRouteInfo>? children})
      : super(
          WeatherCityFinderRouter.name,
          initialChildren: children,
        );

  static const String name = 'WeatherCityFinderRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WeatherMapPage]
class WeatherMapRoute extends _i6.PageRouteInfo<void> {
  const WeatherMapRoute({List<_i6.PageRouteInfo>? children})
      : super(
          WeatherMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherMapRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeatherMapRouterPage]
class WeatherMapRouter extends _i6.PageRouteInfo<void> {
  const WeatherMapRouter({List<_i6.PageRouteInfo>? children})
      : super(
          WeatherMapRouter.name,
          initialChildren: children,
        );

  static const String name = 'WeatherMapRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
