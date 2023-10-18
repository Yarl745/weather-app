import 'package:weatherapp/features/weather_search/domain/entities/day_weather_forecast.dart';

class DayWeatherForecastModel {
  DayWeatherForecastModel({
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

  static DayWeatherForecastModel fromJson(Map<String, dynamic> json) {
    return DayWeatherForecastModel(
      tempDay: json['main']['temp'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      weatherName: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherId: json['weather'][0]['id'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }

  static Map<String, dynamic> toJson(DayWeatherForecast entity) {
    return {
      'tempDay': entity.tempDay,
      'tempMax': entity.tempMax,
      'tempMin': entity.tempMin,
      'weatherName': entity.weatherName,
      'weatherDescription': entity.weatherDescription,
      'weatherId': entity.weatherId,
      'dt': entity.dateTime.millisecondsSinceEpoch ~/ 1000,
    };
  }

  DayWeatherForecast toEntity() {
    return DayWeatherForecast(
      tempDay: tempDay,
      tempMax: tempMax,
      tempMin: tempMin,
      weatherName: weatherName,
      weatherDescription: weatherDescription,
      weatherId: weatherId,
      dateTime: dateTime,
    );
  }
}
