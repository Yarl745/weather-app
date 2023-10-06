import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/base_widgets/buttons/primary_button_with_logo.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/paddings.dart';
import 'package:weatherapp/core/translations/local_keys.g.dart';

class ContinueWithServiceButton extends StatelessWidget {
  const ContinueWithServiceButton({
    Key? key,
    required this.onContinueTap,
    this.padding = CPaddings.horizontal12,
    required this.serviceName,
    required this.serviceIconData,
  }) : super(key: key);

  final Function() onContinueTap;
  final EdgeInsets padding;
  final String serviceName;
  final IconData serviceIconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CPaddings.horizontal12,
      child: PrimaryButtonWithLogo(
        buttonText: "${LocaleKeys.continueWith.tr()} $serviceName",
        activeColor: Clr.of(context).shadedWhite,
        activeTextColor: Clr.of(context).black,
        logoWidget: Icon(serviceIconData, size: 24, color: Clr.of(context).black),
        isActive: true,
        onTap: onContinueTap,
      ),
    );
  }
}
