import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/text_style.dart';
import 'package:weatherapp/features/weather_search/domain/entities/day_weather_forecast.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/custom_weather_box_widget.dart';

class CityDayWeatherWidget extends StatelessWidget {
  const CityDayWeatherWidget({
    Key? key,
    required this.dayWeatherForecast,
    required this.cityName,
    required this.countryName,
  }) : super(key: key);

  final String cityName;
  final String countryName;
  final DayWeatherForecast dayWeatherForecast;

  @override
  Widget build(BuildContext context) {
    return CustomWeatherBoxWidget(
      height: 230,
      width: double.infinity,
      maxWidth: 360,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final weatherImgSize = constraints.maxHeight / 1.55;
            return Stack(
              children: [
                Positioned(
                  top: -4,
                  right: 6,
                  child: Image.asset(
                    dayWeatherForecast.weatherTypeImageAsset,
                    height: weatherImgSize,
                    width: weatherImgSize,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        dayWeatherForecast.tempDayFormatted,
                        style: inter.s64.w700.primary(context),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${dayWeatherForecast.dayName} >',
                        style: inter.s16.w500.primary(context),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    '$cityName, $countryName',
                    // dayWeatherForecast.dayName,
                    style: inter.s22.w500.primary(context),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    '${dayWeatherForecast.tempMinFormatted} ~ ${dayWeatherForecast.tempMaxFormatted}',
                    style: inter.s18.w400.copyWith(
                      color: Clr.of(context).onSurfaceContainer.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
