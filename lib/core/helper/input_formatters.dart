import 'package:flutter/services.dart';
import 'package:flutter_clean_arch/core/helper/extensions.dart';

class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalize,
      selection: newValue.selection,
    );
  }
}
