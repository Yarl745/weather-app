import 'package:flutter/services.dart';
import 'package:weatherapp/core/helper/string_ext.dart';

class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalize,
      selection: newValue.selection,
    );
  }
}
