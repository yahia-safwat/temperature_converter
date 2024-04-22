import 'package:flutter/material.dart';

/// A class responsible for providing different input decoration styles.
class InputStyles {
  static InputDecoration customInputDecoration({
    InputBorder? border = const OutlineInputBorder(),
  }) {
    return InputDecoration(
      border: border,
      filled: false,
      fillColor: Colors.white,
    );
  }
}
