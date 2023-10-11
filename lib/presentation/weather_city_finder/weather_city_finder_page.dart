import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WeatherCityFinderPage extends StatefulWidget {
  const WeatherCityFinderPage({Key? key}) : super(key: key);

  @override
  State<WeatherCityFinderPage> createState() => _WeatherCityFinderPageState();
}

class _WeatherCityFinderPageState extends State<WeatherCityFinderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
