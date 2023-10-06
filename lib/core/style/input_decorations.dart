import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/border_radiuses.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

abstract class InputDecorations {
  static InputDecoration loginOutline(BuildContext context) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all10,
          borderSide: BorderSide(color: Clr.of(context).mainBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all10,
          borderSide: BorderSide(color: Clr.of(context).lightGrey),
        ),
        border: OutlineInputBorder(
          borderRadius: CBorderRadius.all10,
          borderSide: BorderSide(color: Clr.of(context).lightGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all10,
          borderSide: BorderSide(color: Clr.of(context).red),
        ),
      );
}
