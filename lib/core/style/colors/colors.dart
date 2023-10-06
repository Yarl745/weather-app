import 'package:flutter/material.dart';
import 'package:weatherapp/core/style/colors/color_themes.dart';

class ClrThemeWidget extends StatefulWidget {
  const ClrThemeWidget({
    Key? key,
    required this.child,
    required this.isDarkTheme,
  }) : super(key: key);

  final Widget child;
  final bool isDarkTheme;

  @override
  State<ClrThemeWidget> createState() => _ClrThemeWidgetState();
}

class _ClrThemeWidgetState extends State<ClrThemeWidget> {
  late bool isDarkMode;

  @override
  void initState() {
    isDarkMode = widget.isDarkTheme;
    super.initState();
  }

  void changeTheme({required bool isDarkMode}) {
    setState(() => this.isDarkMode = isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Clr(
      isDarkMode: isDarkMode,
      child: widget.child,
    );
  }
}

class Clr extends InheritedWidget {
  const Clr({
    super.key,
    required super.child,
    this.isDarkMode = false,
  });

  final bool isDarkMode;

  static Clr of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Clr>()!;
  }

  static void switchTheme(BuildContext context) {
    final state = context.findAncestorStateOfType<_ClrThemeWidgetState>()!;
    state.changeTheme(isDarkMode: !state.isDarkMode);
  }

  static bool isDarkTheme(BuildContext context) {
    final state = context.findAncestorStateOfType<_ClrThemeWidgetState>()!;
    return state.isDarkMode;
  }

  @override
  bool updateShouldNotify(covariant Clr oldWidget) {
    return oldWidget.isDarkMode != isDarkMode;
  }

  Color get black => isDarkMode ? DarkTheme.black : LightTheme.black;
  Color get white => isDarkMode ? DarkTheme.white : LightTheme.white;
  Color get mainBlue => isDarkMode ? DarkTheme.mainBlue : LightTheme.mainBlue;
  Color get darkBlue => isDarkMode ? DarkTheme.darkBlue : LightTheme.darkBlue;
  Color get mainGrey => isDarkMode ? DarkTheme.mainGrey : LightTheme.mainGrey;
  Color get lightGrey => isDarkMode ? DarkTheme.lightGrey : LightTheme.lightGrey;
  Color get shadedWhite => isDarkMode ? DarkTheme.shadedWhite : LightTheme.shadedWhite;
  Color get bgDarkGrey => isDarkMode ? DarkTheme.bgDarkGrey : LightTheme.bgDarkGrey;
  Color get red => isDarkMode ? DarkTheme.red : LightTheme.red;
  Color get gray => isDarkMode ? DarkTheme.gray : LightTheme.gray;
}
