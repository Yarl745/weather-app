import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/helper/widget_ext.dart';
import 'package:flutter_clean_arch/core/style/text_styles.dart';
import 'package:flutter_clean_arch/core/translations/local_keys.g.dart';

class TermsAndPolicyLink extends StatelessWidget {
  const TermsAndPolicyLink({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: LocaleKeys.byContinuingYouAgreeTo.tr(), style: sfPro.s14.w300.shadedWhite(context)),
              TextSpan(text: " ", style: sfPro.s14.w300),
              TextSpan(text: LocaleKeys.privacyPolicy.tr(), style: sfPro.s14.w300.underline.shadedWhite(context)),
              TextSpan(text: " ", style: sfPro.s14.w300),
              TextSpan(text: LocaleKeys.and.tr(), style: sfPro.s14.w300.shadedWhite(context)),
              TextSpan(text: " ", style: sfPro.s14.w300),
              TextSpan(text: LocaleKeys.termsConditions.tr(), style: sfPro.s14.w300.underline.shadedWhite(context)),
            ],
          ),
        ),
      ),
    ).noSplash();
  }
}
