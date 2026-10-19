import 'package:flutter/services.dart';

class LapTimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.length > 6) digits = digits.substring(0, 6); 

    String formatted = digits;
    if (digits.length >= 2) {}

    
    if (digits.isEmpty) {
      formatted = '';
    } else if (digits.length <= 1) {
      formatted = digits;
    } else if (digits.length <= 3) {
      formatted = '${digits.substring(0, 1)}:${digits.substring(1)}'; 
    } else {
      formatted =
          '${digits.substring(0, 1)}:${digits.substring(1, 3)}.${digits.substring(3)}'; 
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
