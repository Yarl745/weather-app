import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';
import 'package:weatherapp/features/weather_search/domain/repositories/weather_search_repository.dart';

part 'city_forecast_state.dart';

class CityForecastCubit extends Cubit<CityForecastState> {
  CityForecastCubit({required WeatherSearchRepository weatherSearchRepository})
      : _weatherSearchRepository = weatherSearchRepository,
        super(const CityForecastInitial());

  final WeatherSearchRepository _weatherSearchRepository;

  void startSearchCityWeatherForecast() => emit(const CityForecastLoading());

  Future<CityWeatherForecast?> searchWeakCityWeatherForecast({required LatLng latLng}) async {
    emit(const CityForecastLoading());

    final cityWeatherForecast = (await _weatherSearchRepository.searchCityWeatherForecast(latLng)).fold(
      (failure) => null,
      (cityWeatherForecast) {
        emit(
          CityForecastLoaded(cityWeatherForecast: cityWeatherForecast),
        );
        return cityWeatherForecast;
      },
    );

    return cityWeatherForecast;
  }

  Future<CityWeatherForecast?> silentSearchWeakCityForecast({required LatLng latLng}) async {
    final cityWeatherForecast = (await _weatherSearchRepository.searchCityWeatherForecast(latLng)).fold(
      (failure) => null,
      (cityWeatherForecast) {
        return cityWeatherForecast;
      },
    );
    return cityWeatherForecast;
  }

  void updateCityWeatherForecast(CityWeatherForecast cityWeatherForecast) {
    emit(
      CityForecastLoaded(cityWeatherForecast: cityWeatherForecast),
    );
  }
}
