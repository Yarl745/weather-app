import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';
import 'package:flutter_clean_arch/core/style/text_styles.dart';

class OverviewText extends StatelessWidget {
  const OverviewText({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: CPaddings.horizontal12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: sfPro.s32.w700.white(context), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Text(description, style: sfPro.s18.w400.white(context), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
