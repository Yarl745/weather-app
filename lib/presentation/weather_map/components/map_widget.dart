import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/app_config.dart';
import 'package:weatherapp/injection_container.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.currentCoordinatePoint,
  }) : super(key: key);

  final LatLng currentCoordinatePoint;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapboxMap(
          styleString: sl<AppConfig>().customMapStylePath,
          accessToken: sl<AppConfig>().mapboxAccessToken,
          onMapCreated: _onMapCreated,
          myLocationEnabled: false,
          trackCameraPosition: true,
          tiltGesturesEnabled: false,
          minMaxZoomPreference: const MinMaxZoomPreference(3.0, 12.0),
          initialCameraPosition: CameraPosition(
            target: widget.currentCoordinatePoint,
            zoom: 9.0,
            tilt: 15.0,
          ),
          onMapClick: (_, latlng) async {
            await mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(latlng.latitude, latlng.longitude),
                  zoom: 9.0,
                  tilt: 15.0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
