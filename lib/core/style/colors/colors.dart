import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/colors/color_themes.dart';

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

  Color get lightBlue => isDarkMode ? DarkTheme.lightBlue : LightTheme.lightBlue;
  Color get lightPurple => isDarkMode ? DarkTheme.lightPurple : LightTheme.lightPurple;
  Color get darkPurple => isDarkMode ? DarkTheme.darkPurple : LightTheme.darkPurple;
  Color get softBlack => isDarkMode ? DarkTheme.softBlack : LightTheme.softBlack;
  Color get gray => isDarkMode ? DarkTheme.gray : LightTheme.gray;
  Color get grayNavigation => isDarkMode ? DarkTheme.grayNavigation : LightTheme.grayNavigation;
  Color get middleGray => isDarkMode ? DarkTheme.middleGray : LightTheme.middleGray;
  Color get lightGray => isDarkMode ? DarkTheme.lightGray : LightTheme.lightGray;
  Color get bgNew => isDarkMode ? DarkTheme.bgNew : LightTheme.bgNew;
  Color get darkGray => isDarkMode ? DarkTheme.darkGray : LightTheme.darkGray;
  Color get grayContacts => isDarkMode ? DarkTheme.grayContacts : LightTheme.grayContacts;
  Color get grayLine => isDarkMode ? DarkTheme.grayLine : LightTheme.grayLine;
  Color get grayTextField => isDarkMode ? DarkTheme.grayTextField : LightTheme.grayTextField;
  Color get grayTextFieldText => isDarkMode ? DarkTheme.grayTextFieldText : LightTheme.grayTextFieldText;
  Color get lightPink => isDarkMode ? DarkTheme.lightPink : LightTheme.lightPink;
  Color get pink => isDarkMode ? DarkTheme.pink : LightTheme.pink;
  Color get grayForDivider => isDarkMode ? DarkTheme.grayForDivider : LightTheme.grayForDivider;
  Color get avatar => isDarkMode ? DarkTheme.avatar : LightTheme.avatar;
  Color get green => isDarkMode ? DarkTheme.green : LightTheme.green;
}
