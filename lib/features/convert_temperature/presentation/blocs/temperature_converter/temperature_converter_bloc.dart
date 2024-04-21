import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/temperature_field.dart';
import '../../../domain/usecases/convert_temperature_usecase.dart';

part 'temperature_converter_event.dart';
part 'temperature_converter_state.dart';

class TemperatureConverterBloc
    extends Bloc<TemperatureConverterEvent, TemperatureConverterState> {
  final ConvertTemperatureUseCase convertTemperatureUseCase;
  TemperatureConverterBloc(this.convertTemperatureUseCase)
      : super(TemperatureConverterInitial()) {
    on<ConvertTemperature>(_onConvertTemperature);
  }

  FutureOr<void> _onConvertTemperature(
      ConvertTemperature event, Emitter<TemperatureConverterState> emit) {
    final result = convertTemperatureUseCase(
      value: event.value,
      fromUnit: event.fromUnit,
      toUnit: event.toUnit,
    );

    emit(TemperatureConverterSuccess(
      value: event.value,
      convertedValue: result.value,
      unit: result.unit,
      field: event.field,
    ));
  }
}
