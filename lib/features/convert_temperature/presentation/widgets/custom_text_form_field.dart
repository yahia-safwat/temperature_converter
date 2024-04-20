import 'package:flutter/material.dart';

import '../../../../core/styles/custom_input_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController tempController;
  final String selectedTemp;
  const CustomTextFormField({
    super.key,
    required this.tempController,
    required this.selectedTemp,
  });

  @override
  Widget build(BuildContext context) {
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
        decoration: InputStyles.customInputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
