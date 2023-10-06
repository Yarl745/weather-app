import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/base_widgets/app_bars/static_back_app_bar.dart';
import 'package:flutter_clean_arch/base_widgets/buttons/small_text_button.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';

class StaticBackAppBarWithButton extends StatelessWidget implements PreferredSizeWidget {
  const StaticBackAppBarWithButton({
    Key? key,
    required this.titleText,
    required this.buttonText,
    this.backgroundColor,
    this.isCenteredTitle = false,
    this.onBackTap,
    this.onRightButtonTap,
  }) : super(key: key);

  final String titleText;
  final String buttonText;
  final Color? backgroundColor;
  final bool isCenteredTitle;
  final Function()? onBackTap;
  final Function()? onRightButtonTap;

  @override
  Widget build(BuildContext context) {
    return StaticBackAppBar(
      rightWidget: SmallTextButton(
        buttonText: buttonText,
        onTap: onRightButtonTap,
        isActive: true,
        activeTextColor: Clr.of(context).white,
        activeColor: Clr.of(context).mainGrey,
      ),
      titleText: titleText,
      backgroundColor: backgroundColor,
      isCenteredTitle: isCenteredTitle,
      onBackTap: onBackTap,
    );
  }

  @override
  Size get preferredSize => const Size(100, 50);
}
