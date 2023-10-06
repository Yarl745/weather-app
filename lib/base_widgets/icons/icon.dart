import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Custom Icon
class CIcon extends StatelessWidget {
  static const double defaultSize = 20;

  final double size;
  final String iconPath;
  final Color? color;

  const CIcon({
    Key? key,
    this.size = defaultSize,
    required this.iconPath,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
