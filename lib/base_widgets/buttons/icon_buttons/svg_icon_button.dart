import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  static const double defaultSize = 20;

  final double size;
  final String iconPath;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onLongPressEnd;
  final Color? color;
  final Color? highlightColor;
  final Color? backgroundColor;
  final double? padding;

  const SvgIconButton({
    Key? key,
    this.size = defaultSize,
    required this.iconPath,
    this.color,
    this.highlightColor,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.onLongPressEnd,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        onLongPress: onLongPress,
        highlightColor: highlightColor,
        child: Padding(
          padding: EdgeInsets.all(padding ?? 6.0),
          child: SizedBox(
            width: size,
            height: size,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                iconPath,
                color: color ?? Clr.of(context).black,
                height: size,
                width: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
