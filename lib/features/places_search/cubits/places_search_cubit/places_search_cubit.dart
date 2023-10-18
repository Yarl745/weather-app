import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_detailed_info.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_search_result.dart';
import 'package:weatherapp/features/places_search/domain/repositories/places_search_repository.dart';

part 'places_search_state.dart';

class PlacesSearchCubit extends Cubit<PlacesSearchState> {
  static const defaultCityInfo = PlaceDetailedInfo(
    placeId: 'ChIJBUVa4U7P1EAR_kYBF9IxSXY',
    description: 'Kyiv, Ukraine',
    latLng: LatLng(50.4501, 30.5234),
  );

  PlacesSearchCubit({required PlacesSearchRepository placesSearchRepository})
      : _placesSearchRepository = placesSearchRepository,
        super(const PlacesSearchInitial());

  final PlacesSearchRepository _placesSearchRepository;

  List<PlaceSearchResult> getLastSearchResult() => state.suggestedPlaces;

  Future<void> searchPlaces(String query) async {
    emit(PlacesSearchLoading(suggestedPlaces: state.suggestedPlaces));

    (await _placesSearchRepository.searchPlaces(query)).fold(
      (failure) => null,
      (searchedPlaces) => emit(
        PlacesSearchSuccess(suggestedPlaces: searchedPlaces),
      ),
    );
  }

  Future<PlaceDetailedInfo?> selectPlace(PlaceSearchResult placeSearchResult) async {
    final selectedPlaceInfo = (await _placesSearchRepository.getPlaceInfo(placeSearchResult)).fold(
      (failure) => null,
      (placeDetailedInfo) {
        emit(
          SelectPlaceSuccess(
            suggestedPlaces: state.suggestedPlaces,
            selectedPlaceInfo: placeDetailedInfo,
          ),
        );
        return placeDetailedInfo;
      },
    );
    if (selectedPlaceInfo == null) return null;

    await _placesSearchRepository.saveLastPlaceInfo(selectedPlaceInfo);

    return selectedPlaceInfo;
  }

  Future<PlaceDetailedInfo> getLastSearchedPlace() async {
    final selectedPlaceInfo = (_placesSearchRepository.getLastPlaceInfo()).fold(
      (failure) => null,
      (placeDetailedInfo) {
        emit(
          SelectPlaceSuccess(
            suggestedPlaces: state.suggestedPlaces,
            selectedPlaceInfo: defaultCityInfo,
          ),
        );
        return placeDetailedInfo ?? defaultCityInfo;
      },
    );

    return selectedPlaceInfo ?? defaultCityInfo;
  }
}
