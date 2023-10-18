import 'dart:collection';

import 'package:weatherapp/features/weather_search/data/models/day_weather_forecast_model.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';
import 'package:weatherapp/features/weather_search/domain/entities/day_weather_forecast.dart';

class CityWeatherForecastModel {
  const CityWeatherForecastModel({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.timeZone,
    required this.forecastTimestampsCount,
    required this.threeHoursForecastModels,
  });

  final int id;
  final String cityName;
  final String countryName;
  final int timeZone;
  final int forecastTimestampsCount;
  final List<DayWeatherForecastModel> threeHoursForecastModels;

  static CityWeatherForecastModel fromJson(Map<String, dynamic> json) {
    final threeHoursForecastJsons = json['list'] as List<dynamic>;
    final threeHoursForecastModels = threeHoursForecastJsons
        .map(
          (json) => DayWeatherForecastModel.fromJson(json),
        )
        .toList();
    return CityWeatherForecastModel(
      id: json['city']['id'],
      cityName: json['city']['name'],
      countryName: json['city']['country'],
      timeZone: json['city']['timezone'],
      forecastTimestampsCount: json['cnt'],
      threeHoursForecastModels: threeHoursForecastModels,
    );
  }

  static Map<String, dynamic> toJson(CityWeatherForecast entity) {
    return {
      'id': entity.id,
      'cityName': entity.cityName,
      'countryName': entity.countryName,
      'timeZone': entity.timeZone,
      'forecastDaysCount': entity.forecastTimestampsCount,
      'dayWeatherForecastModels': entity.dayWeatherForecasts
          .map(
            (innerEntity) => DayWeatherForecastModel.toJson(innerEntity),
          )
          .toList(),
    };
  }

  CityWeatherForecast toEntity() {
    return CityWeatherForecast(
      id: id,
      cityName: cityName,
      countryName: countryName,
      timeZone: timeZone,
      forecastTimestampsCount: forecastTimestampsCount,
      dayWeatherForecasts: aggregateDailyForecasts(
        threeHoursForecastModels.map((model) => model.toEntity()).toList(),
      ),
    );
  }

  List<DayWeatherForecast> aggregateDailyForecasts(List<DayWeatherForecast> threeHourForecasts) {
    final Map<String, List<DayWeatherForecast>> dailyForecastsMap = HashMap();
    final List<DayWeatherForecast> aggregatedForecasts = [];

    // Grouping forecasts by day
    for (var forecast in threeHourForecasts) {
      String date = forecast.dateTime.toLocal().toString().split(' ')[0];
      if (dailyForecastsMap[date] == null) {
        dailyForecastsMap[date] = [];
      }
      dailyForecastsMap[date]!.add(forecast);
    }

    dailyForecastsMap.forEach((day, forecasts) {
      double tempDaySum = 0;
      double tempMax = double.negativeInfinity;
      double tempMin = double.infinity;

      WeatherType? majorWeatherType;
      final Map<WeatherType, int> weatherTypeCounts = HashMap();

      for (var forecast in forecasts) {
        tempDaySum += forecast.tempDay;
        tempMax = tempMax < forecast.tempMax ? forecast.tempMax : tempMax;
        tempMin = tempMin > forecast.tempMin ? forecast.tempMin : tempMin;

        WeatherType currentType = forecast.weatherType;
        weatherTypeCounts.update(currentType, (count) => count + 1, ifAbsent: () => 1);
      }

      // Sorting weather types by their occurrence frequency and predefined priority
      List<WeatherType> sortedWeatherTypes = weatherTypeCounts.keys.toList()
        ..sort((a, b) => weatherTypeCounts[b]!.compareTo(weatherTypeCounts[a]!));

      // Picking the most frequent severe weather type, if any
      for (var type in sortedWeatherTypes) {
        if (type == WeatherType.thunderstorm ||
            type == WeatherType.drizzle ||
            type == WeatherType.rain ||
            type == WeatherType.snow ||
            type == WeatherType.atmosphere) {
          majorWeatherType = type;
          break;
        }
      }

      // If no severe weather types, picking the most frequent one
      majorWeatherType ??= sortedWeatherTypes.first;

      final dayForecast = forecasts.firstWhere((forecast) => forecast.weatherType == majorWeatherType);

      aggregatedForecasts.add(
        DayWeatherForecast(
          tempDay: tempDaySum / forecasts.length,
          tempMax: tempMax,
          tempMin: tempMin,
          weatherName: dayForecast.weatherName,
          weatherDescription: dayForecast.weatherDescription,
          weatherId: dayForecast.weatherId,
          dateTime: DateTime.parse(day),
        ),
      );
    });

    aggregatedForecasts.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return aggregatedForecasts;
  }
}
