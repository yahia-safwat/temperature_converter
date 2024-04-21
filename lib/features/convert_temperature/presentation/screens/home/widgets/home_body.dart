import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/temperature_converter/temperature_converter_bloc.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/dropdown_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TemperatureConverterBloc>(context);

    return BlocBuilder<TemperatureConverterBloc, TemperatureConverterState>(
      builder: (context, state) {
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
                          selectedTemp: bloc.selectedUnit1,
                          temperatures: temperatures,
                          onChanged: (value) {
                            // Dispatch event to update unit1
                            bloc.add(UpdateUnit1(value.toString()));
                          },
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
                          selectedTemp: bloc.selectedUnit2,
                          temperatures: temperatures,
                          onChanged: (value) {
                            // Dispatch event to update unit2
                            bloc.add(UpdateUnit2(value.toString()));
                          },
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
      },
    );
  }
}

List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvan'];
