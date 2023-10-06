import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';

class CTheme {
  static getAppTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Clr.of(context).bgDarkGrey,
        // bottomAppBarTheme: BottomAppBarTheme(
        //   color: Clr.of(context).black,
        // ),
        appBarTheme: AppBarTheme(
          color: Clr.of(context).bgDarkGrey,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );
}
