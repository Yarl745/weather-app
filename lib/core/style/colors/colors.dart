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

  Color get primary => isDarkMode ? DarkTheme.primary : LightTheme.primary;
  Color get onPrimary => isDarkMode ? DarkTheme.onPrimary : LightTheme.onPrimary;
  Color get secondary => isDarkMode ? DarkTheme.secondary : LightTheme.secondary;
  Color get onSecondary => isDarkMode ? DarkTheme.onSecondary : LightTheme.onSecondary;
  Color get primaryContainer => isDarkMode ? DarkTheme.primaryContainer : LightTheme.primaryContainer;
  Color get onPrimaryContainer => isDarkMode ? DarkTheme.onPrimaryContainer : LightTheme.onPrimaryContainer;
  Color get surface => isDarkMode ? DarkTheme.surface : LightTheme.surface;
  Color get onSurface => isDarkMode ? DarkTheme.onSurface : LightTheme.onSurface;
  Color get surfaceContainer => isDarkMode ? DarkTheme.surfaceContainer : LightTheme.surfaceContainer;
  Color get onSurfaceContainer => isDarkMode ? DarkTheme.onSurfaceContainer : LightTheme.onSurfaceContainer;
  Color get surfaceContainerHigh => isDarkMode ? DarkTheme.surfaceContainerHigh : LightTheme.surfaceContainerHigh;
  Color get onSurfaceContainerHigh => isDarkMode ? DarkTheme.onSurfaceContainerHigh : LightTheme.onSurfaceContainerHigh;
  Color get surfaceContainerHighest =>
      isDarkMode ? DarkTheme.surfaceContainerHighest : LightTheme.surfaceContainerHighest;
  Color get onSurfaceContainerHighest =>
      isDarkMode ? DarkTheme.onSurfaceContainerHighest : LightTheme.onSurfaceContainerHighest;
  Color get surfaceVariant => isDarkMode ? DarkTheme.surfaceVariant : LightTheme.surfaceVariant;
  Color get onSurfaceVariant => isDarkMode ? DarkTheme.onSurfaceVariant : LightTheme.onSurfaceVariant;
  Color get outline => isDarkMode ? DarkTheme.outline : LightTheme.outline;
  Color get outlineVariant => isDarkMode ? DarkTheme.outlineVariant : LightTheme.outlineVariant;
  Color get black => isDarkMode ? DarkTheme.black : LightTheme.black;
  Color get white => isDarkMode ? DarkTheme.white : LightTheme.white;
}
