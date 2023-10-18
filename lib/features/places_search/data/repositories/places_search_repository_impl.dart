import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/error_handler.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/core/helper/type_aliases.dart';
import 'package:weatherapp/features/places_search/data/datasource/places_search_cache_datasource.dart';
import 'package:weatherapp/features/places_search/data/datasource/places_search_http_datasource.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_detailed_info.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_search_result.dart';
import 'package:weatherapp/features/places_search/domain/repositories/places_search_repository.dart';

class PlacesSearchRepositoryImpl extends PlacesSearchRepository {
  PlacesSearchRepositoryImpl({
    required PlacesSearchHttpDatasource placesSearchHttpDatasource,
    required PlacesSearchCacheDatasource placesSearchCacheDatasource,
  })  : _placesSearchCacheDatasource = placesSearchCacheDatasource,
        _placesSearchHttpDatasource = placesSearchHttpDatasource;

  final PlacesSearchHttpDatasource _placesSearchHttpDatasource;
  final PlacesSearchCacheDatasource _placesSearchCacheDatasource;

  @override
  FutureFailable<List<PlaceSearchResult>> searchPlaces(String query) async {
    try {
      final placeModels = await _placesSearchHttpDatasource.searchPlaces(query);
      return Right(placeModels.map((placeModel) => placeModel.toEntity()).toList());
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }

  @override
  FutureFailable<PlaceDetailedInfo> getPlaceInfo(PlaceSearchResult place) async {
    try {
      final latLng = await _placesSearchHttpDatasource.getPlaceCoordinates(place.placeId);
      return Right(
        PlaceDetailedInfo(
          latLng: latLng,
          placeId: place.placeId,
          description: place.description,
        ),
      );
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }

  @override
  Failable<PlaceDetailedInfo?> getLastPlaceInfo() {
    try {
      final lastPlaceInfoModel = _placesSearchCacheDatasource.getLastPlaceInfo();
      return Right(lastPlaceInfoModel?.toEntity());
    } catch (error) {
      return Left(Failure(errorMessage: error.toString()));
    }
  }

  @override
  FutureFailable<Unit> saveLastPlaceInfo(PlaceDetailedInfo placeInfo) async {
    try {
      await _placesSearchCacheDatasource.saveLastPlaceInfo(placeInfo);
      return const Right(unit);
    } catch (error) {
      final failure = await errorHandler(error, const Failure());
      return Left(failure);
    }
  }
}
