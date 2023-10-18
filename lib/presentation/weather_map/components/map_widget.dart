import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/app_config.dart';
import 'package:weatherapp/core/helper/asset_paths.dart';
import 'package:weatherapp/injection_container.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.currentCoordinatePoint,
    required this.onPinTap,
    required this.onMapMove,
  }) : super(key: key);

  final LatLng currentCoordinatePoint;
  final Function(LatLng) onPinTap;
  final Function() onMapMove;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    mapController.onSymbolTapped.add(_onSymbolTapped);
  }

  void _onSymbolTapped(Symbol symbol) {
    if (symbol.options.geometry != null) {
      _animateCameraTo(symbol.options.geometry!, zoom: 11);
      widget.onPinTap(
        LatLng(
          symbol.options.geometry!.latitude,
          symbol.options.geometry!.longitude,
        ),
      );
    }
  }

  void _onMapLongPress(_, LatLng latLng) async {
    await mapController.clearSymbols();
    await mapController.addSymbol(
      SymbolOptions(
        geometry: latLng,
        iconImage: Assets.mapPin,
        draggable: false,
        iconSize: 0.2,
      ),
    );
  }

  void _animateCameraTo(LatLng latLng, {double zoom = 7}) async {
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latLng.latitude, latLng.longitude),
          zoom: zoom,
          tilt: 15.0,
        ),
      ),
    );
  }

  void _onMapMove() => widget.onMapMove();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapboxMap(
          accessToken: sl<AppConfig>().mapboxAccessToken,
          styleString: sl<AppConfig>().customMapStylePath,
          onMapCreated: _onMapCreated,
          onCameraIdle: _onMapMove,
          myLocationEnabled: false,
          trackCameraPosition: true,
          tiltGesturesEnabled: false,
          minMaxZoomPreference: const MinMaxZoomPreference(3.0, 12.0),
          initialCameraPosition: CameraPosition(
            target: widget.currentCoordinatePoint,
            zoom: 6.0,
            tilt: 15.0,
          ),
          onMapLongClick: _onMapLongPress,
          onMapClick: (_, latLng) async => _animateCameraTo(latLng),
        ),
      ],
    );
  }
}
