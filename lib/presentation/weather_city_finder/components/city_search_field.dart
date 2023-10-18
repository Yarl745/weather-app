import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weatherapp/base_widgets/buttons/styled_icon_button.dart';
import 'package:weatherapp/core/helper/widget_ext.dart';
import 'package:weatherapp/core/style/border_radius_const.dart';
import 'package:weatherapp/core/style/colors/colors.dart';
import 'package:weatherapp/core/style/text_style.dart';

class CitySearchField extends StatefulWidget {
  const CitySearchField({
    Key? key,
    required this.onTextInput,
    required this.enabled,
    this.hintText = 'Search...',
    this.millisecondsDebounce = 1000,
    this.autofocus = false,
    this.onSubmitted,
    this.focusNode,
    this.keyboardType = TextInputType.number,
    this.selectedValue,
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String? selectedValue;
  final String hintText;
  final Function(String) onTextInput;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final int millisecondsDebounce;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextInputType keyboardType;

  @override
  State<CitySearchField> createState() => _CitySearchFieldState();
}

class _CitySearchFieldState extends State<CitySearchField> {
  late final FocusNode focusNode;
  late final TextEditingController textController;
  final _textStream = BehaviorSubject<String>();
  bool onFocus = false;
  bool isFieldNotEmpty = false;

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
  void dispose() {
    if (widget.focusNode == null) focusNode.dispose();
    textController.dispose();
    _textStream.close();
    super.dispose();
  }

  void onSubmittedValue(String value) {
    if (widget.onSubmitted != null) widget.onSubmitted!(value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CupertinoSearchTextField(
        enabled: widget.enabled,
        keyboardType: TextInputType.name,
        autofocus: widget.autofocus,
        controller: textController,
        focusNode: focusNode,
        placeholder: widget.hintText,
        style: inter.s20.w500.onSurface(context),
        onChanged: (text) => _textStream.add(text),
        onSubmitted: onSubmittedValue,
        decoration: BoxDecoration(
          color: Clr.of(context).surfaceContainer,
          borderRadius: CBorderRadius.all16,
          border: Border.all(color: Clr.of(context).outline),
        ),
        prefixIcon: Visibility(
          visible: widget.enabled == true,
          replacement: const SearchIcon(),
          child: BackIconButton(color: Clr.of(context).onSurface),
        ),
      ),
    ).noSplash();
  }
}

class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return StyledIconButton(
      icon: Icon(
        Icons.arrow_back_rounded,
        size: 24,
        color: color ?? Clr.of(context).outlineVariant,
      ),
      onPressed: () => context.router.pop(),
    );
  }
}

class ClearIconButton extends StatelessWidget {
  const ClearIconButton({Key? key, required this.onTap, this.color}) : super(key: key);

  final Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return StyledIconButton(
      icon: Icon(
        Icons.clear,
        size: 24,
        color: color ?? Clr.of(context).outlineVariant,
      ),
      onPressed: onTap,
    );
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      size: 24,
      color: color ?? Clr.of(context).outlineVariant,
    );
  }
}
