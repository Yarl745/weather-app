import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WeatherMapPage extends StatefulWidget {
  const WeatherMapPage({Key? key}) : super(key: key);

  @override
  State<WeatherMapPage> createState() => _WeatherMapPageState();
}

class _WeatherMapPageState extends State<WeatherMapPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
