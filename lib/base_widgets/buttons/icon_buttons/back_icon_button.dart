import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/base_widgets/buttons/icon_buttons/custom_icon_button.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key, this.onBackTap}) : super(key: key);

  final Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      iconData: Icons.arrow_back,
      size: 24,
      onTap: () => context.router.pop(),
      highlightColor: Colors.transparent,
    );
  }
}
