import 'package:easy_localization/easy_localization.dart';
import 'package:weatherapp/core/helper/asset_paths.dart';

enum WeatherType { thunderstorm, drizzle, rain, snow, atmosphere, clear, clouds }

class DayWeatherForecast {
  DayWeatherForecast({
    required this.tempDay,
    required this.tempMax,
    required this.tempMin,
    required this.weatherName,
    required this.weatherDescription,
    required this.weatherId,
    required this.dateTime,
  });

  final double tempDay;
  final double tempMax;
  final double tempMin;
  final String weatherName;
  final String weatherDescription;
  final int weatherId;
  final DateTime dateTime;

  String get tempDayFormatted => '${tempDay.round()}°';
  String get tempMaxFormatted => '${tempMax.round()}°';
  String get tempMinFormatted => '${tempMin.round()}°';

  WeatherType get weatherType {
    switch (weatherId ~/ 100) {
      case 2:
        return WeatherType.thunderstorm;
      case 3:
        return WeatherType.drizzle;
      case 5:
        return WeatherType.rain;
      case 6:
        return WeatherType.snow;
      case 7:
        return WeatherType.atmosphere;
      case 8:
        return weatherId == 800 ? WeatherType.clear : WeatherType.clouds;
      default:
        return WeatherType.clear;
    }
  }

  String get weatherTypeImageAsset {
    switch (weatherType) {
      case WeatherType.thunderstorm:
        return Assets.lightningWithRain;
      case WeatherType.drizzle:
        return Assets.twoCloudsLightRain;
      case WeatherType.rain:
        return Assets.twoCloudsHeavyRain;
      case WeatherType.snow:
        return Assets.twoClouds;
      case WeatherType.atmosphere:
        return Assets.wind;
      case WeatherType.clear:
        return Assets.sun;
      case WeatherType.clouds:
        return Assets.sunBehindCloud;
    }
  }

  String get dayName {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

    String formattedDate = DateFormat('EEEE').format(dateTime);

    if (DateTime(dateTime.year, dateTime.month, dateTime.day) == DateTime(now.year, now.month, now.day)) {
      return 'Today';
    } else if (DateTime(dateTime.year, dateTime.month, dateTime.day) ==
        DateTime(tomorrow.year, tomorrow.month, tomorrow.day)) {
      return 'Tomorrow';
    } else {
      return formattedDate;
    }
  }

  @override
  String toString() {
    return 'DayWeatherForecast{tempDay: $tempDay, tempMax: $tempMax, tempMin: $tempMin, weatherName: $weatherName, weatherDescription: $weatherDescription, weatherId: $weatherId, dateTime: $dateTime}';
  }
}
