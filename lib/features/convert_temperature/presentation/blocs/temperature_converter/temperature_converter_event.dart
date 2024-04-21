part of 'temperature_converter_bloc.dart';

sealed class TemperatureConverterEvent {}

class ConvertTemperature extends TemperatureConverterEvent {
  final double value;
  final String fromUnit;
  final String toUnit;
  final TemperatureField field;

  ConvertTemperature({
    required this.value,
    required this.fromUnit,
    required this.toUnit,
    required this.field,
  });
}
