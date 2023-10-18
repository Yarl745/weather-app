import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/theme_const.dart';
import 'package:weatherapp/features/places_search/cubits/places_search_cubit/places_search_cubit.dart';
import 'package:weatherapp/features/weather_search/cubits/city_forecast_cubit/city_forecast_cubit.dart';
import 'package:weatherapp/router/router.dart';

import 'app_config.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjectionContainer().init();

  sl<AppConfig>();

  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return EasyLocalization(
          supportedLocales: const [Locale('en')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const ClrThemeWidget(
            isDarkTheme: false,
            child: MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    if (Platform.isAndroid) {
      FlutterAppBadger.removeBadge();
    }
    preloadWeatherData();
  }

  void preloadWeatherData() async {
    final lastPlaceInfo = await sl<PlacesSearchCubit>().getLastSearchedPlace();
    await sl<CityForecastCubit>().searchWeakCityWeatherForecast(
      latLng: lastPlaceInfo.latLng,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CTheme.getAppTheme(context),
      routerConfig: appRouter.config(
        navigatorObservers: () => [BotToastNavigatorObserver()],
      ),
    );
  }
}
