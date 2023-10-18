import 'package:dartz/dartz.dart';
import 'package:mapbox_gl_platform_interface/mapbox_gl_platform_interface.dart';
import 'package:weatherapp/core/error/error_handler.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/core/helper/type_aliases.dart';
import 'package:weatherapp/features/weather_search/data/datasource/weather_search_http_datasource.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';
import 'package:weatherapp/features/weather_search/domain/repositories/weather_search_repository.dart';

class WeatherSearchRepositoryImpl extends WeatherSearchRepository {
  WeatherSearchRepositoryImpl({required WeatherSearchHttpDatasource weatherSearchHttpDatasource})
      : _weatherSearchHttpDatasource = weatherSearchHttpDatasource;

  final WeatherSearchHttpDatasource _weatherSearchHttpDatasource;

  @override
  FutureFailable<CityWeatherForecast> searchCityWeatherForecast(LatLng latLng, {int days = 10}) async {
    try {
      final cityForecastModel = await _weatherSearchHttpDatasource.searchCityWeatherForecast(latLng);
      return Right(cityForecastModel.toEntity());
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }
}
