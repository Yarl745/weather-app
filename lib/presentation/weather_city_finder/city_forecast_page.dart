import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/base_widgets/loadings/styled_progress_loading.dart';
import 'package:weatherapp/core/helper/asset_paths.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/features/weather_search/cubits/city_forecast_cubit/city_forecast_cubit.dart';
import 'package:weatherapp/features/weather_search/domain/entities/city_weather_forecast.dart';
import 'package:weatherapp/injection_container.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/city_day_weather_widget.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/city_search_field.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/sliver_search_bar.dart';

@RoutePage()
class CityForecastPage extends StatefulWidget {
  const CityForecastPage({Key? key, this.cityWeatherForecast}) : super(key: key);

  final CityWeatherForecast? cityWeatherForecast;

  @override
  State<CityForecastPage> createState() => _CityForecastPageState();
}

class _CityForecastPageState extends State<CityForecastPage> {
  @override
  void initState() {
    super.initState();
    _showWeakForecastIfFromMap();
  }

  void _showWeakForecastIfFromMap() {
    if (widget.cityWeatherForecast != null) {
      sl<CityForecastCubit>().updateCityWeatherForecast(
        widget.cityWeatherForecast!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.blueSkyBackground),
              fit: BoxFit.cover,
              opacity: .45,
            ),
          ),
          // padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverSearchBar(
                floating: true,
                pinned: false,
                backgroundColor: Clr.of(context).surfaceContainerHighest,
                height: 54,
                child: CitySearchField(
                  enabled: false,
                  onTextInput: (_) {},
                  hintText: 'Search for a city',
                  onTap: () => context.router.pushNamed('search'),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              BlocBuilder<CityForecastCubit, CityForecastState>(
                bloc: sl<CityForecastCubit>(),
                builder: (context, state) {
                  if (state is CityForecastLoaded) {
                    final cityWeatherForecast = state.cityWeatherForecast;
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList.builder(
                        itemCount: cityWeatherForecast?.dayWeatherForecasts.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 45),
                            child: CityDayWeatherWidget(
                              dayWeatherForecast: cityWeatherForecast!.dayWeatherForecasts[index],
                              cityName: cityWeatherForecast.cityName,
                              countryName: cityWeatherForecast.countryName,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SliverFillRemaining(
                    hasScrollBody: true,
                    child: Center(
                      child: StyledProgressLoading(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
