import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

class StyledProgressLoading extends StatelessWidget {
  const StyledProgressLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(40),
      child: CircularProgressIndicator(
        color: Clr.of(context).primary,
        strokeWidth: 2,
      ),
    );
  }
}
