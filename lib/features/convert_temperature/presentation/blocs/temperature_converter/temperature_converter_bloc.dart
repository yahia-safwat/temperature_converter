import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/conversion_direction.dart';
import '../../../domain/usecases/convert_temperature_usecase.dart';

part 'temperature_converter_event.dart';
part 'temperature_converter_state.dart';

class TemperatureConverterBloc
    extends Bloc<TemperatureConverterEvent, TemperatureConverterState> {
  final ConvertTemperatureUseCase convertTemperatureUseCase;

  List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvin'];

  String selectedUnit1 = 'Celsius';
  String selectedUnit2 = 'Fahrenheit';

  String leftFieldValue = '';
  String rightFieldValue = '';

  String convertedValue = '';

  TemperatureConverterBloc(this.convertTemperatureUseCase)
      : super(TemperatureConverterInitial()) {
    on<ConvertTemperature>(_onConvertTemperature);
    on<UpdateUnit1>(_onUpdateUnit1);
    on<UpdateUnit2>(_onUpdateUnit2);
    on<ResetFields>(_onResetFields);
  }

  _onUpdateUnit1(UpdateUnit1 event, Emitter<TemperatureConverterState> emit) {
    selectedUnit1 = event.unit;
    emit(SelectedUnitsUpdated(unit1: selectedUnit1, unit2: selectedUnit2));
  }

  _onUpdateUnit2(UpdateUnit2 event, Emitter<TemperatureConverterState> emit) {
    selectedUnit2 = event.unit;
    emit(SelectedUnitsUpdated(unit1: selectedUnit1, unit2: selectedUnit2));
  }

  _onResetFields(ResetFields event, Emitter<TemperatureConverterState> emit) {
    leftFieldValue = '';
    rightFieldValue = '';
    convertedValue = '';
    emit(TemperatureConverterInitial());
  }

  _onConvertTemperature(
      ConvertTemperature event, Emitter<TemperatureConverterState> emit) {
    final result =
        convertTemperatureUseCase(event.value, event.fromUnit, event.toUnit);

    if (event.conversionDirection == ConversionDirection.leftToRight) {
      leftFieldValue = event.value.toString();
      rightFieldValue = result.value.toString();

      // Update converted value
      convertedValue = rightFieldValue;
    } else {
      leftFieldValue = result.value.toString();
      rightFieldValue = event.value.toString();

      // Update converted value
      convertedValue = leftFieldValue;
    }

    emit(TemperatureConverterSuccess(convertedValue));
  }
}
