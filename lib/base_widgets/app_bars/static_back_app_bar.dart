import 'package:flutter/material.dart';
import 'package:weatherapp/base_widgets/app_bars/static_app_bar.dart';
import 'package:weatherapp/base_widgets/buttons/icon_buttons/back_icon_button.dart';
import 'package:weatherapp/core/style/text_styles.dart';

class StaticBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StaticBackAppBar({
    Key? key,
    required this.titleText,
    this.rightWidget,
    this.backgroundColor,
    this.isCenteredTitle = false,
    this.onBackTap,
  }) : super(key: key);

  final String titleText;
  final Widget? rightWidget;
  final Color? backgroundColor;
  final bool isCenteredTitle;
  final Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return StaticAppBar(
      leftWidget: BackIconButton(onBackTap: onBackTap),
      titleWidget: Text(titleText, style: sfPro.s20.w500.white(context)),
      rightWidget: rightWidget,
      backgroundColor: backgroundColor,
      isCenteredTitle: isCenteredTitle,
    );
  }

  @override
  Size get preferredSize => const Size(100, 50);
}
