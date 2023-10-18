import 'package:weatherapp/features/weather_search/domain/entities/day_weather_forecast.dart';

/// dayWeatherForecasts - forecast for each 3 hour a day
class CityWeatherForecast {
  const CityWeatherForecast({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.timeZone,
    required this.forecastTimestampsCount,
    required this.dayWeatherForecasts,
  });

  final int id;
  final String cityName;
  final String countryName;
  final int timeZone;
  final int forecastTimestampsCount;
  final List<DayWeatherForecast> dayWeatherForecasts;

  @override
  String toString() {
    return 'CityWeatherForecast{id: $id, cityName: $cityName, countryName: $countryName, timeZone: $timeZone, forecastDaysCount: $forecastTimestampsCount, dayWeatherForecasts: $dayWeatherForecasts}';
  }
}
