import 'package:weatherapp/features/places_search/domain/entities/place_search_result.dart';

class PlaceSearchResultModel {
  const PlaceSearchResultModel({
    required this.placeId,
    required this.description,
  });

  final String placeId;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'place_id': placeId,
      'description': description,
    };
  }

  factory PlaceSearchResultModel.fromJson(Map<String, dynamic> json) {
    return PlaceSearchResultModel(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
    );
  }

  PlaceSearchResult toEntity() {
    return PlaceSearchResult(placeId: placeId, description: description);
  }
}
