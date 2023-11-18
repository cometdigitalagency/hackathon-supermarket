import 'package:flutter/services.dart';

class LaoCurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Remove any non-digit characters
    newText = newText.replaceAll(RegExp('[^0-9]'), '');

    // Insert a comma every three characters from the end
    final StringBuffer newTextBuffer = StringBuffer();
    for (int i = newText.length - 1, groupCount = 0;
        i >= 0;
        i--, groupCount++) {
      newTextBuffer.write(newText[i]);
      if (groupCount == 2 && i > 0) {
        newTextBuffer.write(',');
        groupCount = -1;
      }
    }

    final String formattedText =
        newTextBuffer.toString().split('').reversed.join();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
