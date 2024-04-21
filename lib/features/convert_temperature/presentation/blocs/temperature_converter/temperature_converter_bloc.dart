import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/temperature_field.dart';
import '../../../domain/usecases/convert_temperature_usecase.dart';

part 'temperature_converter_event.dart';
part 'temperature_converter_state.dart';

class TemperatureConverterBloc
    extends Bloc<TemperatureConverterEvent, TemperatureConverterState> {
  final ConvertTemperatureUseCase convertTemperatureUseCase;

  String selectedUnit1 = 'Celsius';
  String selectedUnit2 = 'Fahrenheit';

  var enteredValue = 0.0;
  var convertedValue = 0.0;

  TemperatureConverterBloc(this.convertTemperatureUseCase)
      : super(TemperatureConverterInitial()) {
    on<ConvertTemperature>(_onConvertTemperature);
    on<UpdateUnit1>(_onUpdateUnit1);
    on<UpdateUnit2>(_onUpdateUnit2);
  }

  FutureOr<void> _onUpdateUnit1(
      UpdateUnit1 event, Emitter<TemperatureConverterState> emit) {
    selectedUnit1 = event.unit;
    emit(SelectedUnitsUpdated(
      unit1: selectedUnit1,
      unit2: selectedUnit2,
    ));
  }

  FutureOr<void> _onUpdateUnit2(
      UpdateUnit2 event, Emitter<TemperatureConverterState> emit) {
    selectedUnit2 = event.unit;
    emit(SelectedUnitsUpdated(
      unit1: selectedUnit1,
      unit2: selectedUnit2,
    ));
  }

  FutureOr<void> _onConvertTemperature(
      ConvertTemperature event, Emitter<TemperatureConverterState> emit) {
    final result = convertTemperatureUseCase(
      value: event.value,
      fromUnit: event.fromUnit,
      toUnit: event.toUnit,
    );

    enteredValue = event.value;
    convertedValue = result.value;

    emit(TemperatureConverterSuccess(
      enteredvalue: event.value,
      convertedValue: result.value,
      unit: result.unit,
      field: event.field,
    ));
  }
}
