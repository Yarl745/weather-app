import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/core/helper/type_aliases.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';

abstract class WeatherSearchRepository {
  FutureFailable<CityWeatherForecast> searchCityWeatherForecast(LatLng latLng, {int days = 10});
}
