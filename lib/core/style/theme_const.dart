import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

/// Const Theme,
class CTheme {
  static getAppTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Clr.of(context).surface,
        appBarTheme: AppBarTheme(
          color: Clr.of(context).surfaceContainerHighest,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );
}
