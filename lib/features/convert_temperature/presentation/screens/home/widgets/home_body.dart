import 'package:flutter/material.dart';

import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/dropdown_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownItem(
                      selectedTemp: 'Celsius',
                      temperatures: temperatures,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextFormField(
                      tempController: TextEditingController(),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownItem(
                      selectedTemp: 'Fahrenheit',
                      temperatures: temperatures,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      tempController: TextEditingController(),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvan'];
