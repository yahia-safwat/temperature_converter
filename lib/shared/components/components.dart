import 'package:flutter/material.dart';
import 'package:temperature_converter/shared/style/color.dart';
import 'package:temperature_converter/shared/style/style.dart';

Widget buildSizedBox(double? height) {
  return SizedBox(height: height);
}

Widget buildVerticalSizedBox(double? width) {
  return SizedBox(width: width);
}

Widget buildHeading(String headingTitle) {
  return Container(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      headingTitle,
      style: const TextStyle(fontSize: 20, color: Colors.grey),
    ),
  );
}

Widget buildButton(
  BuildContext context, {
  required String title,
  required void Function()? onPressed,
  Color backgroundColor = defaultColor,
}) {
  return ButtonTheme(
    minWidth: 160,
    height: 60,
    child: Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(title,
            style: const TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
  );
}

Widget buildOutputField(
  BuildContext context, {
  required String title,
  required String data,
}) {
  return Column(
    children: <Widget>[
      Container(
        color: defaultColor,
        width: 115,
        height: 30,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        width: 115,
        height: 30,
        child: Center(
          child: Text(
            data,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      )
    ],
  );
}

Widget buildTextFormField(
  BuildContext context, {
  required void Function()? onTap,
  required TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        showCursor: true,
        readOnly: true,
        onTap: onTap,
        controller: controller,
        decoration: getTextFieldWithCalendarIconDecoration(context),
      )
    ],
  );
}
