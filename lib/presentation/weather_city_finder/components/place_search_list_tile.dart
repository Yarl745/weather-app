import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/text_style.dart';
import 'package:weatherapp/presentation/weather_city_finder/components/city_search_field.dart';

class PlaceSearchListTile extends StatelessWidget {
  const PlaceSearchListTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Clr.of(context).surfaceContainer,
      leading: SearchIcon(color: Clr.of(context).secondary),
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(
        title,
        style: inter.s20.w500.onSurfaceContainer(context),
        maxLines: 1,
      ),
    );
  }
}
