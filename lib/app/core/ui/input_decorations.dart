import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    final _myBlueColor = Color(0xFF2184c3);

    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _myBlueColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _myBlueColor,
            width: 2,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: _myBlueColor) : null);
  }
}