import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/router/router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: const [
        WeatherMapRouter(),
        WeatherCityFinderRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: Clr.of(context).surfaceContainerHigh,
        );
      },
    );
  }
}
