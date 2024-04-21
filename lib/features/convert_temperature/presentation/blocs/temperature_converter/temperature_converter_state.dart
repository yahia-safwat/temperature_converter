part of 'temperature_converter_bloc.dart';

sealed class TemperatureConverterState {}

final class TemperatureConverterInitial extends TemperatureConverterState {}

class TemperatureConverterSuccess extends TemperatureConverterState {
  final double value;
  final double convertedValue;
  final String unit;
  final TemperatureField field;

  TemperatureConverterSuccess({
    required this.value,
    required this.convertedValue,
    required this.unit,
    required this.field,
  });
}
