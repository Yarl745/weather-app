import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weatherapp/core/helper/hive_consts.dart';
import 'package:weatherapp/features/places_search/injection_container.dart';
import 'package:weatherapp/features/weather_search/injection_container.dart';

import 'app_config.dart';
import 'core/interceptors/error_logger_interceptor.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with PlacesSearchInjector, WeatherSearchInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();

    sl.registerSingleton<Box>(
      await Hive.openBox(CHive.placeDetailedInfoDataBox),
      instanceName: CHive.placeDetailedInfoDataBox,
    );

    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);

    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio();
        dio.options.headers = {
          "content-type": "application/json",
          "Accept": "application/json",
        };
        dio.interceptors.add(ErrorLoggerInterceptor());
        if (!sl<AppConfig>().isProductionEnvironment) {
          dio.interceptors.add(PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
          ));
        }
        return dio;
      },
      instanceName: globalDio,
    );

    //External
    sl.registerLazySingleton(() => InternetConnectionChecker.createInstance(
          checkTimeout: const Duration(seconds: 2),
          checkInterval: const Duration(seconds: 3),
        ));

    //Core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  }
}
