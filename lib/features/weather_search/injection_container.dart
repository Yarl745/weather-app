import 'package:dio/dio.dart';
import 'package:weatherapp/app_config.dart';
import 'package:weatherapp/features/weather_search/cubits/city_forecast_cubit/city_forecast_cubit.dart';
import 'package:weatherapp/features/weather_search/data/datasource/weather_search_http_datasource.dart';
import 'package:weatherapp/features/weather_search/data/repositories/weather_search_repository_impl.dart';
import 'package:weatherapp/features/weather_search/domain/repositories/weather_search_repository.dart';
import 'package:weatherapp/injection_container.dart';

mixin WeatherSearchInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);

    // data sources
    sl.registerLazySingleton<WeatherSearchHttpDatasource>(
      () => WeatherSearchHttpDatasourceImpl(
        dio: dio,
        openWeatherApiKey: sl<AppConfig>().openWeatherMapApiKey,
      ),
    );

    // repositories
    sl.registerLazySingleton<WeatherSearchRepository>(
      () => WeatherSearchRepositoryImpl(weatherSearchHttpDatasource: sl()),
    );

    // cubits
    sl.registerLazySingleton<CityForecastCubit>(
      () => CityForecastCubit(weatherSearchRepository: sl()),
    );
  }
}
