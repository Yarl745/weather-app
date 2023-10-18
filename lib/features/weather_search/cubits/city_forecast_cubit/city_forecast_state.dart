part of 'city_forecast_cubit.dart';

abstract class CityForecastState extends Equatable {
  const CityForecastState({this.cityWeatherForecast});

  final CityWeatherForecast? cityWeatherForecast;

  @override
  List<Object?> get props => [cityWeatherForecast];
}

class CityForecastInitial extends CityForecastState {
  const CityForecastInitial();
}

class CityForecastLoading extends CityForecastState {
  const CityForecastLoading();
}

class CityForecastLoaded extends CityForecastState {
  const CityForecastLoaded({required super.cityWeatherForecast});
}
