import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';
import 'package:flutter_clean_arch/core/style/text_styles.dart';
import 'package:flutter_clean_arch/core/translations/local_keys.g.dart';

class MainAuthText extends StatelessWidget {
  const MainAuthText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CPaddings.horizontal12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(text: LocaleKeys.readingBecomes.tr(), style: sfPro.s32.w700.white(context)),
                TextSpan(text: " ", style: sfPro.s32.w700),
                TextSpan(text: LocaleKeys.fun.tr(), style: sfPro.s32.w700.mainBlue(context)),
                TextSpan(text: " ", style: sfPro.s32.w700),
                TextSpan(text: LocaleKeys.and.tr(), style: sfPro.s32.w700.white(context)),
                TextSpan(text: " ", style: sfPro.s32.w700),
                TextSpan(text: LocaleKeys.easy.tr(), style: sfPro.s32.w700.mainBlue(context)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.logInToPersonalizeYourExperience.tr(),
            style: sfPro.s18.w400.white(context),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
