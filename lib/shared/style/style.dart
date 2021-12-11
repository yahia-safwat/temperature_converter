import 'package:flutter/material.dart';
import 'package:temperature_converter/business/temp_calculator.dart';

InputDecoration getTextFormFieldDecoration(
  BuildContext context, {
  required String selectedTemp,
}) {
  return InputDecoration(
    border: InputBorder.none,
    suffixText: TempCalc.getSuffixText(selectedTemp),
  );
}
