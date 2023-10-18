import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/features/places_search/cubits/places_search_cubit/places_search_cubit.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_search_result.dart';
import 'package:weatherapp/features/weather_search/cubits/city_forecast_cubit/city_forecast_cubit.dart';
import 'package:weatherapp/injection_container.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/city_search_field.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/place_search_list_tile.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/sliver_search_bar.dart';

@RoutePage()
class CitySearchPage extends StatefulWidget {
  const CitySearchPage({Key? key}) : super(key: key);

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  void onTextInput(text) {
    if (text.isNotEmpty) sl<PlacesSearchCubit>().searchPlaces(text);
  }

  void onSelectPlace(PlaceSearchResult placeSearchResult) async {
    context.router.pop();
    sl<CityForecastCubit>().startSearchCityWeatherForecast();
    final placeInfo = await sl<PlacesSearchCubit>().selectPlace(placeSearchResult);
    await sl<CityForecastCubit>().searchWeakCityWeatherForecast(latLng: placeInfo!.latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          // padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverSearchBar(
                floating: true,
                pinned: true,
                backgroundColor: Clr.of(context).surfaceContainerHighest,
                height: 54,
                child: CitySearchField(
                  enabled: true,
                  autofocus: true,
                  onTextInput: onTextInput,
                  millisecondsDebounce: 500,
                  hintText: 'Search for a city',
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              BlocBuilder<PlacesSearchCubit, PlacesSearchState>(
                bloc: sl<PlacesSearchCubit>(),
                builder: (context, state) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList.builder(
                      itemCount: state.suggestedPlaces.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: PlaceSearchListTile(
                            title: state.suggestedPlaces[index].description,
                            onTap: () => onSelectPlace(state.suggestedPlaces[index]),
                          ),
                        );
                      },
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
