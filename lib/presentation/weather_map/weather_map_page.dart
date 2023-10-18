import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/weather_search/cubits/city_forecast_cubit/city_forecast_cubit.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';
import 'package:weatherapp/injection_container.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/city_day_weather_widget.dart';
import 'package:weatherapp/presentation/weather_map/components/map_widget.dart';
import 'package:weatherapp/router/router.gr.dart';

@RoutePage()
class WeatherMapPage extends StatefulWidget {
  const WeatherMapPage({Key? key}) : super(key: key);

  @override
  State<WeatherMapPage> createState() => _WeatherMapPageState();
}

class _WeatherMapPageState extends State<WeatherMapPage> {
  static const defaultPoint = LatLng(50.450001, 30.523333);
  CityWeatherForecast? cityWeatherForecast;

  void _onPinTap(LatLng latLng) async {
    final cityForecast = await sl<CityForecastCubit>().silentSearchWeakCityForecast(latLng: latLng);
    setState(() => cityWeatherForecast = cityForecast);
  }

  void _onMapMove() {
    setState(() => cityWeatherForecast = null);
  }

  void _openWeakForecastForPlace() {
    context.router.root.push(
      CityForecastRoute(cityWeatherForecast: cityWeatherForecast),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            MapWidget(
              currentCoordinatePoint: defaultPoint,
              onPinTap: _onPinTap,
              onMapMove: _onMapMove,
            ),
            if (cityWeatherForecast != null)
              Positioned(
                top: 60,
                child: InkWell(
                  onTap: _openWeakForecastForPlace,
                  child: CityDayWeatherWidget(
                    dayWeatherForecast: cityWeatherForecast!.dayWeatherForecasts.first,
                    cityName: cityWeatherForecast!.cityName,
                    countryName: cityWeatherForecast!.countryName,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
