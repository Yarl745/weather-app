import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/base_widgets/buttons/primary_button.dart';
import 'package:weatherapp/core/style/paddings.dart';
import 'package:weatherapp/core/translations/local_keys.g.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.onContinueTap,
    this.padding = CPaddings.horizontal12,
  }) : super(key: key);

  final Function() onContinueTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CPaddings.horizontal12,
      child: PrimaryButton(
        buttonText: LocaleKeys.continueLabel.tr(),
        isActive: true,
        onTap: onContinueTap,
      ),
    );
  }
}
