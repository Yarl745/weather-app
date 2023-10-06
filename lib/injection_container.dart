import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/helper/hive_names.dart';
import 'package:flutter_clean_arch/features/user_session/injection_container.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_config.dart';
import 'core/interceptors/error_logger_interceptor.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with UserSessionInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    // final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();

    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();

    sl.registerSingleton<Box>(
      await Hive.openBox(HiveNames.userSessionDataBox),
      instanceName: HiveNames.userSessionDataBox,
    );
    // sl<Box>(instanceName: HiveNames.userSessionDataBox).clear();

    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);

    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(BaseOptions(
          baseUrl: sl<AppConfig>().api,
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 15000),
        ));
        dio.options.headers = {
          "content-type": "application/json",
          "Accept": "application/json",
          // "App-Timezone": currentTimeZone
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
    sl.registerLazySingleton(() => InternetConnectionChecker());

    //Core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  }
}
