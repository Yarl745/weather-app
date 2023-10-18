import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/colors.dart';

class SliverSearchBar extends StatelessWidget {
  const SliverSearchBar({
    Key? key,
    required this.floating,
    required this.pinned,
    required this.child,
    this.backgroundColor,
    this.height,
  }) : super(key: key);

  final bool floating;
  final bool pinned;
  final Widget child;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SearchBarDelegate(
        height: height ?? 54,
        backgroundColor: backgroundColor ?? Clr.of(context).surfaceContainerHighest,
        child: child,
      ),
      floating: floating,
      pinned: pinned,
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  _SearchBarDelegate({
    required this.height,
    required this.backgroundColor,
    required this.child,
  });

  final double height;
  final Widget child;
  final Color? backgroundColor;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) {
    return height != oldDelegate.height;
  }
}
