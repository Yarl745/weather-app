import 'package:weatherapp/core/helper/type_aliases.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_detailed_info.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_search_result.dart';

abstract class PlacesSearchRepository {
  FutureFailable<List<PlaceSearchResult>> searchPlaces(String query);
  FutureFailable<PlaceDetailedInfo> getPlaceInfo(PlaceSearchResult place);
  FutureFailable<void> saveLastPlaceInfo(PlaceDetailedInfo placeInfo);
  Failable<PlaceDetailedInfo?> getLastPlaceInfo();
}
