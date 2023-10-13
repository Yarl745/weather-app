import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:weatherapp/presentation/weather_map/components/map_widget.dart';

@RoutePage()
class WeatherMapPage extends StatefulWidget {
  const WeatherMapPage({Key? key}) : super(key: key);

  @override
  State<WeatherMapPage> createState() => _WeatherMapPageState();
}

class _WeatherMapPageState extends State<WeatherMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const MapWidget(
          currentCoordinatePoint: LatLng(50.450001, 30.523333),
        ),
      ),
    );
  }
}
