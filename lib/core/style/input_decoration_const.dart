import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/border_radius_const.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

/// Const InputDecoration
abstract class CInputDecoration {
  static InputDecoration citySearchOutline(BuildContext context) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all20,
          borderSide: BorderSide(color: Clr.of(context).outline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all20,
          borderSide: BorderSide(color: Clr.of(context).outline, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: CBorderRadius.all20,
          borderSide: BorderSide(color: Clr.of(context).outline, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: CBorderRadius.all20,
          borderSide: BorderSide(color: Clr.of(context).outline, width: 1),
        ),
      );
}
