import 'package:flutter/material.dart';

import '../../../../core/styles/custom_input_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController tempController;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.tempController,
    this.onChanged,
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
        onChanged: onChanged,
        decoration: InputStyles.customInputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
