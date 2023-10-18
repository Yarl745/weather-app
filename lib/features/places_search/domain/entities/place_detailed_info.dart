import 'package:mapbox_gl/mapbox_gl.dart';

class PlaceDetailedInfo {
  const PlaceDetailedInfo({
    required this.placeId,
    required this.description,
    required this.latLng,
  });

  final String placeId;
  final String description;
  final LatLng latLng;

  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'description': description,
      'latLng': latLng.toJson(),
    };
  }

  factory PlaceDetailedInfo.fromJson(Map<String, dynamic> json) {
    final latLng = json['latLng'] as List<double>;
    return PlaceDetailedInfo(
      placeId: json['placeId'] as String,
      description: json['description'] as String,
      latLng: LatLng(latLng[0], latLng[1]),
    );
  }

  @override
  String toString() {
    return 'PlaceDetailedInfo{placeId: $placeId, description: $description, latLng: $latLng}';
  }
}
