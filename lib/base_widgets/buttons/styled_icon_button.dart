import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.tooltip,
    this.withSplash = false,
  });

  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final String? tooltip;
  final bool withSplash;

  @override
  Widget build(BuildContext context) {
    Widget button = Material(
      type: MaterialType.transparency,
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: withSplash ? null : Colors.transparent,
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip ?? '',
        child: button,
      );
    }

    return button;
  }
}
