import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/temperature_field.dart';
import '../../../blocs/temperature_converter/temperature_converter_bloc.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/dropdown_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // list for dropdown items
  final List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvin'];

  // initial selected dropdown value
  String selectedTemp1 = 'Celsius';
  String selectedTemp2 = 'Fahrenheit';

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TemperatureConverterBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<TemperatureConverterBloc,
                      TemperatureConverterState>(
                    builder: (context, state) {
                      switch (state) {
                        case TemperatureConverterInitial():
                          return Column(
                            children: [
                              DropdownItem(
                                selectedTemp: selectedTemp1,
                                temperatures: temperatures,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTemp1 = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                tempController: TextEditingController(),
                                onChanged: (value) {
                                  // Add ConvertTemperature event
                                  bloc.add(
                                    ConvertTemperature(
                                      value: double.tryParse(value) ?? 0.0,
                                      fromUnit: selectedTemp1,
                                      toUnit: selectedTemp2,
                                      field: TemperatureField.leftToRight,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );

                        case TemperatureConverterSuccess():
                          return Column(
                            children: [
                              DropdownItem(
                                selectedTemp: selectedTemp1,
                                temperatures: temperatures,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTemp1 = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                tempController: TextEditingController(
                                    text: state.field ==
                                            TemperatureField.leftToRight
                                        ? state.value.toString()
                                        : state.convertedValue.toString()),
                                onChanged: (value) {
                                  // Add ConvertTemperature event
                                  bloc.add(
                                    ConvertTemperature(
                                      value: double.tryParse(value) ?? 0.0,
                                      fromUnit: selectedTemp1,
                                      toUnit: selectedTemp2,
                                      field: TemperatureField.rightToLeft,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );

                        default:
                          return const CircularProgressIndicator();
                      }
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
                  BlocBuilder<TemperatureConverterBloc,
                      TemperatureConverterState>(
                    builder: (context, state) {
                      switch (state) {
                        case TemperatureConverterInitial():
                          return Column(
                            children: [
                              DropdownItem(
                                selectedTemp: selectedTemp2,
                                temperatures: temperatures,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTemp2 = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                tempController: TextEditingController(),
                                onChanged: (value) {
                                  // Add ConvertTemperature event
                                  bloc.add(
                                    ConvertTemperature(
                                      value: double.tryParse(value) ?? 0.0,
                                      fromUnit: selectedTemp2,
                                      toUnit: selectedTemp1,
                                      field: TemperatureField.rightToLeft,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );

                        case TemperatureConverterSuccess():
                          return Column(
                            children: [
                              DropdownItem(
                                selectedTemp: selectedTemp2,
                                temperatures: temperatures,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTemp2 = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                tempController: TextEditingController(
                                    text: state.field ==
                                            TemperatureField.rightToLeft
                                        ? state.value.toString()
                                        : state.convertedValue.toString()),
                                onChanged: (value) {
                                  // Add ConvertTemperature event
                                  bloc.add(
                                    ConvertTemperature(
                                      value: double.tryParse(value) ?? 0.0,
                                      fromUnit: selectedTemp2,
                                      toUnit: selectedTemp1,
                                      field: TemperatureField.rightToLeft,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        default:
                          return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
