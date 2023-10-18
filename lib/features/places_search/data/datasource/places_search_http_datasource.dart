import 'package:dio/dio.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/places_search/data/models/place_search_result_model.dart';

abstract class PlacesSearchHttpDatasource {
  Future<List<PlaceSearchResultModel>> searchPlaces(String query);

  Future<LatLng> getPlaceCoordinates(String placeId);
}

class PlacesSearchHttpDatasourceImpl extends PlacesSearchHttpDatasource {
  PlacesSearchHttpDatasourceImpl({required Dio dio, required String googleApiKey})
      : _googleApiKey = googleApiKey,
        _dio = dio;

  final Dio _dio;
  final String _googleApiKey;

  @override
  Future<List<PlaceSearchResultModel>> searchPlaces(String query) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      queryParameters: {
        'input': query,
        'types': ['(cities)'],
        'key': _googleApiKey,
      },
    );
    final predictions = response.data['predictions'] as List;
    return predictions.map((json) => PlaceSearchResultModel.fromJson(json)).toList();
  }

  @override
  Future<LatLng> getPlaceCoordinates(String placeId) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: {
        'placeid': placeId,
        'fields': ['geometry', 'name', 'address_component'].join(','),
        'key': _googleApiKey,
      },
    );
    final location = response.data['result']['geometry']['location'];
    return LatLng(location['lat'] as double, location['lng'] as double);
  }
}
