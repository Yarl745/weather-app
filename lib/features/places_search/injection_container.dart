import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherapp/app_config.dart';
import 'package:weatherapp/core/helper/hive_consts.dart';
import 'package:weatherapp/features/places_search/cubits/places_search_cubit/places_search_cubit.dart';
import 'package:weatherapp/features/places_search/data/datasource/places_search_cache_datasource.dart';
import 'package:weatherapp/features/places_search/data/datasource/places_search_http_datasource.dart';
import 'package:weatherapp/features/places_search/data/repositories/places_search_repository_impl.dart';
import 'package:weatherapp/features/places_search/domain/repositories/places_search_repository.dart';
import 'package:weatherapp/injection_container.dart';

mixin PlacesSearchInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);
    final placeDetailedInfoDataBox = sl<Box>(instanceName: CHive.placeDetailedInfoDataBox);

    // data sources
    sl
      ..registerLazySingleton<PlacesSearchHttpDatasource>(
        () => PlacesSearchHttpDatasourceImpl(
          dio: dio,
          googleApiKey: sl<AppConfig>().googleApiKey,
        ),
      )
      ..registerLazySingleton<PlacesSearchCacheDatasource>(
        () => PlacesSearchCacheDatasourceImpl(
          placeDetailedInfoDataBox: placeDetailedInfoDataBox,
        ),
      );

    // repositories
    sl.registerLazySingleton<PlacesSearchRepository>(
      () => PlacesSearchRepositoryImpl(
        placesSearchHttpDatasource: sl(),
        placesSearchCacheDatasource: sl(),
      ),
    );

    // cubits
    sl.registerLazySingleton<PlacesSearchCubit>(
      () => PlacesSearchCubit(placesSearchRepository: sl()),
    );
  }
}
