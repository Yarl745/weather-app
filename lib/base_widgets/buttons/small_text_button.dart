import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/border_radiuses.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';
import 'package:flutter_clean_arch/core/style/text_styles.dart';

class SmallTextButton extends StatelessWidget {
  const SmallTextButton({
    super.key,
    this.isActive = false,
    this.onTap,
    required this.buttonText,
    this.activeColor,
    this.activeTextColor,
  });

  final bool isActive;
  final Function()? onTap;
  final String buttonText;
  final Color? activeColor;
  final Color? activeTextColor;

  Color getActiveColor(BuildContext context) => activeColor ?? Clr.of(context).mainGrey;

  Color getActiveTextColor(BuildContext context) => activeTextColor ?? Clr.of(context).white;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: CBorderRadius.all8,
      color: isActive ? getActiveColor(context) : Clr.of(context).mainGrey,
      child: InkWell(
        borderRadius: CBorderRadius.all8,
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: isActive == false ? Colors.transparent : null,
        child: Container(
          height: 10 * 2 + 14,
          padding: CPaddings.v10h8,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              buttonText,
              style: sfPro.s14.w400.h10.copyWith(
                color: getActiveTextColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
