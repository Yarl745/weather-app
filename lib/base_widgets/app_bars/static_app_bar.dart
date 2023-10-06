import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';

class StaticAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final bool isCenteredTitle;

  const StaticAppBar({
    Key? key,
    this.leftWidget,
    this.rightWidget,
    this.titleWidget,
    this.backgroundColor,
    this.isCenteredTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Clr.of(context).lightGrey, width: 1),
        ),
      ),
      child: AppBar(
        title: titleWidget,
        centerTitle: isCenteredTitle,
        backgroundColor: backgroundColor,
        elevation: 0,
        // leadingWidth: 100,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: CPaddings.horizontal16,
            child: leftWidget,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: CPaddings.horizontal16,
              child: rightWidget,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(100, 50);
}
