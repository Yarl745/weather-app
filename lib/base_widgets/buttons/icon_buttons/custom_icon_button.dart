import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.size = defaultSize,
    this.padding = defaultPadding,
    required this.iconData,
    this.color,
    this.highlightColor,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.onLongPressEnd,
  }) : super(key: key);

  static const double defaultSize = 20;
  static const double defaultPadding = 6;

  final double size;
  final IconData iconData;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onLongPressEnd;
  final Color? color;
  final Color? highlightColor;
  final Color? backgroundColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: size * 0.7,
      splashColor: Colors.transparent,
      highlightColor: highlightColor,
      onPressed: onTap,
      padding: EdgeInsets.all(padding),
      icon: Icon(
        iconData,
        size: size,
        color: color ?? Clr.of(context).white,
      ),
    );
    // return Material(
    //   borderRadius: BorderRadius.circular(100),
    //   color: backgroundColor ?? Colors.transparent,
    //   clipBehavior: Clip.hardEdge,
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(100),
    //     onTap: onTap,
    //     onLongPress: onLongPress,
    //     highlightColor: highlightColor,
    //     child: Container(
    //       height: size,
    //       width: size,
    //       child: Icon(
    //         iconData,
    //         size: size,
    //         color: color ?? Clr.of(context).white,
    //       ),
    //     ),
    //   ),
    // );
  }
}
