import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = newValue.text;

    formatted = formatted.replaceAll(RegExp(r'[^0-9]'), '');

    if (formatted.length > 3) {
      formatted =
          '${formatted.substring(0, formatted.length - 3)} ${formatted.substring(formatted.length - 3)}';
    }
    if (formatted.length > 7) {
      formatted =
          '${formatted.substring(0, formatted.length - 7)} ${formatted.substring(formatted.length - 7)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
