import 'package:dio/dio.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/weather_search/data/models/city_weather_forecast_model.dart';

abstract class WeatherSearchHttpDatasource {
  Future<CityWeatherForecastModel> searchCityWeatherForecast(LatLng latLng);
}

class WeatherSearchHttpDatasourceImpl extends WeatherSearchHttpDatasource {
  WeatherSearchHttpDatasourceImpl({required Dio dio, required String openWeatherApiKey})
      : _dio = dio,
        _openWeatherApiKey = openWeatherApiKey;

  final Dio _dio;
  final String _openWeatherApiKey;

  /// https://openweathermap.org/price
  /// https://openweathermap.org/forecast5 --- used free api
  @override
  Future<CityWeatherForecastModel> searchCityWeatherForecast(LatLng latLng) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': latLng.latitude,
        'lon': latLng.longitude,
        'units': 'metric',
        'appid': _openWeatherApiKey,
      },
    );
    return CityWeatherForecastModel.fromJson(response.data);
  }
}
