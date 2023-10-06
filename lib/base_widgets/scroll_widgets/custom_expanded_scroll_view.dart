import 'package:flutter/material.dart';

class CustomExpandedScrollView extends StatelessWidget {
  const CustomExpandedScrollView({
    Key? key,
    required this.child,
    this.physics,
    this.hasScrollBody = false,
  }) : super(key: key);

  final Widget child;
  final ScrollPhysics? physics;
  final bool hasScrollBody;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: hasScrollBody,
          child: child,
        ),
      ],
    );
  }
}
