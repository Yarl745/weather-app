import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/base_widgets/buttons/primary_button.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';
import 'package:flutter_clean_arch/core/translations/local_keys.g.dart';

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
