import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/border_radiuses.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';
import 'package:flutter_clean_arch/core/style/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.height = 50,
    this.width = double.infinity,
    this.isActive = false,
    this.onTap,
    required this.buttonText,
    this.activeColor,
    this.activeTextColor,
  });

  final double height;
  final double width;
  final bool isActive;
  final Function()? onTap;
  final String buttonText;
  final Color? activeColor;
  final Color? activeTextColor;

  Color getActiveColor(BuildContext context) => activeColor ?? Clr.of(context).mainBlue;

  Color getActiveTextColor(BuildContext context) => activeTextColor ?? Clr.of(context).white;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: CBorderRadius.all10,
      color: isActive ? getActiveColor(context) : Clr.of(context).mainGrey,
      child: InkWell(
        borderRadius: CBorderRadius.all10,
        onTap: onTap,
        splashColor: isActive == false ? Colors.transparent : Colors.transparent,
        highlightColor: isActive == false ? Colors.transparent : null,
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              buttonText,
              style: sfPro.s18.w500.copyWith(
                color: getActiveTextColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
