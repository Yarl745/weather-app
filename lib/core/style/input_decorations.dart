import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/border_radiuses.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';

abstract class InputDecorations {
  // static final commentOutline = InputDecoration(
  //   fillColor: Clr.white,
  //   filled: true,
  //   hintStyle: ubuntu.s14.w400.black50,
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8),
  //     borderSide: const BorderSide(color: Clr.mainPink),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8),
  //     borderSide: const BorderSide(color: Clr.lightGrey),
  //   ),
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8),
  //     borderSide: const BorderSide(color: Clr.lightGrey),
  //   ),
  // );

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
