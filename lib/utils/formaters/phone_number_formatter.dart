import 'package:flutter/services.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters from the new value
    String formattedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Apply the length limit
    if (formattedText.length > 9) {
      formattedText = formattedText.substring(0, 9);
    }

    // Add the spaces to the formatted text
    if (formattedText.length > 2) {
      formattedText = '${formattedText.substring(0, 2)} ${formattedText.substring(2, formattedText.length)}';
    }
    if (formattedText.length > 6) {
      formattedText = '${formattedText.substring(0, 6)} ${formattedText.substring(6, formattedText.length)}';
    }
    if (formattedText.length > 9) {
      formattedText = '${formattedText.substring(0, 9)} ${formattedText.substring(9, formattedText.length)}';
    }

    // Return the updated text editing value
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
