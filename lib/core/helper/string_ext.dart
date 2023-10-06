extension TextExt on String {
  bool isValidEmailFormat() =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool hasNumbers() => RegExp(r"^(?=.*?[0-9])").hasMatch(this);

  bool hasLowercaseChars() => RegExp(r"^(?=.*?[a-z])").hasMatch(this);

  bool hasUppercaseChars() => RegExp(r"^(?=.*?[A-Z])").hasMatch(this);

  bool hasSpecialChars() => RegExp(r"^(?=.*?[!@#\$&*~])").hasMatch(this);

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String get capitalize => isEmpty ? "" : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get capitalizeFirstOfEach => split(" ").map((str) => str.capitalize).join(" ");
}

extension ConvertExt on String {
  double toDoubleIncludingInt() {
    return (double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0);
  }
}

extension FileNameExt on String {
  String get fileNameWithoutType {
    final text = split(".");
    text.removeLast();
    return text.join('.');
  }

  String get fileNameFromPath => substring(lastIndexOf('/') + 1);

  String get fileNameFromPathWithoutType => fileNameFromPath.fileNameWithoutType;
}
