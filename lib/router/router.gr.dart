// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:weatherapp/presentation/auth/create_account_page.dart' as _i2;
import 'package:weatherapp/presentation/auth/main_auth_page.dart' as _i4;
import 'package:weatherapp/presentation/home/home_page.dart' as _i3;
import 'package:weatherapp/presentation/onboarding/onboarding_page.dart' as _i5;
import 'package:weatherapp/router/router.dart' as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthRouterPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreateAccountPage(),
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
        child: const _i1.MainAppRouterPage(),
      );
    },
    MainAuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainAuthPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthRouterPage]
class AuthRouter extends _i6.PageRouteInfo<void> {
  const AuthRouter({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateAccountPage]
class CreateAccountRoute extends _i6.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

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
/// [_i1.MainAppRouterPage]
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
/// [_i4.MainAuthPage]
class MainAuthRoute extends _i6.PageRouteInfo<void> {
  const MainAuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
