import 'package:flutter/material.dart';
import 'package:temperature_converter/shared/style/color.dart';
import 'package:temperature_converter/shared/style/style.dart';

Widget buildSizedBox(double? height) {
  return SizedBox(height: height);
}

Widget buildVerticalSizedBox(double? width) {
  return SizedBox(width: width);
}

Widget buildTextFormField(
  BuildContext context, {
  required TextEditingController tempController,
  required String selectedTemp,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 6.0,
      horizontal: 10.0,
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 1.5),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: TextFormField(
      controller: tempController,
      keyboardType: TextInputType.number,
      decoration: getTextFormFieldDecoration(
        context,
        selectedTemp: selectedTemp,
      ),
    ),
  );
}

Widget buildDropdown({
  required void Function(Object?)? onChanged,
  required Object? selectedTemp,
  required List<String> temperatures,
}) {
  return Container(
    decoration: BoxDecoration(
      color: defaultColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(
          Icons.unfold_more,
          color: Colors.white,
        ),
        isExpanded: true,
        onChanged: onChanged,
        value: selectedTemp,
        items: (temperatures).map((temperature) {
          return DropdownMenuItem(
            value: temperature,
            child: Center(
              child: Text(
                temperature,
                style: const TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
