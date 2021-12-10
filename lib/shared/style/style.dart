import 'package:flutter/material.dart';

InputDecoration getTextFieldWithCalendarIconDecoration(BuildContext context) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)),
    suffixIcon: Icon(
      Icons.date_range,
      color: Theme.of(context).primaryColor,
    ),
  );
}
