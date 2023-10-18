part of 'places_search_cubit.dart';

abstract class PlacesSearchState extends Equatable {
  const PlacesSearchState({required this.suggestedPlaces});

  final List<PlaceSearchResult> suggestedPlaces;

  @override
  List<Object> get props => [suggestedPlaces];
}

class PlacesSearchInitial extends PlacesSearchState {
  const PlacesSearchInitial({super.suggestedPlaces = const []});
}

class PlacesSearchLoading extends PlacesSearchState {
  const PlacesSearchLoading({super.suggestedPlaces = const []});
}

class PlacesSearchSuccess extends PlacesSearchState {
  const PlacesSearchSuccess({required super.suggestedPlaces});
}

class PlacesSearchFailure extends PlacesSearchState {
  const PlacesSearchFailure({super.suggestedPlaces = const []});
}

class SelectPlaceSuccess extends PlacesSearchState {
  const SelectPlaceSuccess({required super.suggestedPlaces, required this.selectedPlaceInfo});

  final PlaceDetailedInfo selectedPlaceInfo;

  @override
  List<Object> get props => [suggestedPlaces, selectedPlaceInfo];
}
