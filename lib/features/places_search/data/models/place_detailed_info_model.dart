import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_detailed_info.dart';

class PlaceDetailedInfoModel {
  const PlaceDetailedInfoModel({
    required this.placeId,
    required this.description,
    required this.latLng,
  });

  final String placeId;
  final String description;
  final LatLng latLng;

  static Map<String, dynamic> toJson(PlaceDetailedInfo entity) {
    return {
      'placeId': entity.placeId,
      'description': entity.description,
      'latLng': entity.latLng.toJson(),
    };
  }

  factory PlaceDetailedInfoModel.fromJson(Map<dynamic, dynamic> json) {
    final latLng = json['latLng'] as List<dynamic>;
    return PlaceDetailedInfoModel(
      placeId: json['placeId'] as String,
      description: json['description'] as String,
      latLng: LatLng(latLng[0], latLng[1]),
    );
  }

  PlaceDetailedInfo toEntity() {
    return PlaceDetailedInfo(
      placeId: placeId,
      description: description,
      latLng: latLng,
    );
  }
}
