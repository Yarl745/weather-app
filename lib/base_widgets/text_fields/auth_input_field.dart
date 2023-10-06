import 'package:flutter/material.dart';
import 'package:weatherapp/base_widgets/buttons/icon_buttons/custom_icon_button.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/input_decorations.dart';
import 'package:weatherapp/core/style/text_styles.dart';
import 'package:rxdart/rxdart.dart';

class AuthInputField extends StatefulWidget {
  const AuthInputField({
    Key? key,
    required this.iconData,
    required this.hintText,
    required this.onTextInput,
    this.isPassword = false,
    this.millisecondsDebounce = 1000,
    this.autofocus = false,
    this.errorText,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);

  final String hintText;
  final Function(String) onTextInput;
  final Function(String)? onSubmitted;
  final bool isPassword;
  final String? errorText;
  final int millisecondsDebounce;
  final IconData iconData;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  late final FocusNode focusNode;
  late final TextEditingController textController;
  final _textStream = BehaviorSubject<String>();
  bool onFocus = false;
  bool isPasswordVisible = false;
  bool isFieldNotEmpty = false;
  String? errorText;

  Widget get suffixIconButton {
    if (widget.isPassword) {
      return PasswordVisibilityIconButton(
        isPasswordVisible: isPasswordVisible,
        onTap: () {
          setState(() => isPasswordVisible = !isPasswordVisible);
        },
      );
    } else {
      return ClearFieldIconButton(
        isFieldNotEmpty: isFieldNotEmpty,
        onTap: () {
          textController.clear();
          showRaiseTextButton();
        },
      );
    }
  }

  Color get fieldColor {
    if (onFocus) {
      return Clr.of(context).mainBlue.withOpacity(0.2);
    } else {
      return errorText == null ? Clr.of(context).mainGrey : Clr.of(context).red.withOpacity(0.2);
    }
  }

  Color get iconColor {
    if (onFocus) {
      return Clr.of(context).mainBlue;
    } else {
      return errorText == null ? Clr.of(context).lightGrey : Clr.of(context).red;
    }
  }

  void showRaiseTextButton() {
    final text = textController.text;
    if (isFieldNotEmpty != text.isNotEmpty && widget.isPassword == false) {
      setState(() => isFieldNotEmpty = text.isNotEmpty);
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    textController = TextEditingController();
    _textStream
        .debounceTime(
      Duration(milliseconds: widget.millisecondsDebounce),
    )
        .listen(
      (text) {
        widget.onTextInput(text);
      },
    );
    focusNode.addListener(() {
      setState(() => onFocus = focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(covariant AuthInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    errorText = widget.errorText;
  }

  @override
  void dispose() {
    if (widget.focusNode == null) focusNode.dispose();
    textController.dispose();
    _textStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus,
      controller: textController,
      focusNode: focusNode,
      style: sfPro.s16.w400.white(context),
      cursorColor: Clr.of(context).mainBlue,
      obscureText: widget.isPassword && isPasswordVisible == false,
      obscuringCharacter: '*',
      textAlign: TextAlign.start,
      onChanged: (text) {
        _textStream.add(text);
        showRaiseTextButton();
      },
      onSubmitted: widget.onSubmitted,
      decoration: InputDecorations.loginOutline(context).copyWith(
        prefixIcon: Icon(widget.iconData, size: 20),
        prefixIconColor: iconColor,
        suffixIcon: suffixIconButton,
        suffixIconColor: Clr.of(context).lightGrey,
        alignLabelWithHint: true,
        filled: true,
        fillColor: fieldColor,
        errorText: errorText,
        hintText: widget.hintText,
        hintStyle: sfPro.s16.w400.h10.lightGrey(context),
      ),
    );
  }
}

class PasswordVisibilityIconButton extends StatelessWidget {
  const PasswordVisibilityIconButton({Key? key, required this.isPasswordVisible, required this.onTap})
      : super(key: key);

  final bool isPasswordVisible;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      iconData: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      color: Clr.of(context).lightGrey,
      size: 24,
      onTap: onTap,
    );
  }
}

class ClearFieldIconButton extends StatelessWidget {
  const ClearFieldIconButton({Key? key, required this.isFieldNotEmpty, required this.onTap}) : super(key: key);

  final bool isFieldNotEmpty;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isFieldNotEmpty,
      replacement: const SizedBox(),
      child: CustomIconButton(
        iconData: Icons.clear,
        color: Clr.of(context).lightGrey,
        size: 24,
        onTap: onTap,
      ),
    );
  }
}
