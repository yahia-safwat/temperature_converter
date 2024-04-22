import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/conversion_direction.dart';
import '../../../blocs/temperature_converter/temperature_converter_bloc.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/dropdown_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TemperatureConverterBloc>(context);

    TextEditingController temp1Controller = TextEditingController();
    TextEditingController temp2Controller = TextEditingController();

    return BlocBuilder<TemperatureConverterBloc, TemperatureConverterState>(
      builder: (context, state) {
        // Update text fields values
        temp1Controller.text = bloc.leftFieldValue;
        temp2Controller.text = bloc.rightFieldValue;

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
                          temperatures: bloc.temperatures,
                          onChanged: (value) {
                            // Dispatch event to update unit1
                            bloc.add(UpdateUnit1(value.toString()));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextFormField(
                          tempController: temp1Controller,
                          onChanged: (value) {
                            // Dispatch event to convert temperature
                            bloc.add(ConvertTemperature(
                              value: value.toString(),
                              fromUnit: bloc.selectedUnit1,
                              toUnit: bloc.selectedUnit2,
                              conversionDirection:
                                  ConversionDirection.leftToRight,
                            ));
                          },
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
                          temperatures: bloc.temperatures,
                          onChanged: (value) {
                            // Dispatch event to update unit2
                            bloc.add(UpdateUnit2(value.toString()));
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          tempController: temp2Controller,
                          onChanged: (value) {
                            // Dispatch event to convert temperature
                            bloc.add(ConvertTemperature(
                              value: value.toString(),
                              fromUnit: bloc.selectedUnit2,
                              toUnit: bloc.selectedUnit1,
                              conversionDirection:
                                  ConversionDirection.rightToLeft,
                            ));
                          },
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
