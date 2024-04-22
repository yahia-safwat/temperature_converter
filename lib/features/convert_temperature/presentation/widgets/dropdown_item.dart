import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class DropdownItem extends StatelessWidget {
  final void Function(Object?)? onChanged;
  final Object? selectedTemp;
  final List<String> temperatures;
  const DropdownItem({
    super.key,
    this.onChanged,
    this.selectedTemp,
    required this.temperatures,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.defaultColor,
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
}
