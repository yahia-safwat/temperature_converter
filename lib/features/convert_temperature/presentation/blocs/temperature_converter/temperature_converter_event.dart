part of 'temperature_converter_bloc.dart';

sealed class TemperatureConverterEvent {}

class UpdateUnit1 extends TemperatureConverterEvent {
  final String unit;
  UpdateUnit1(this.unit);
}

class UpdateUnit2 extends TemperatureConverterEvent {
  final String unit;
  UpdateUnit2(this.unit);
}

class ConvertTemperature extends TemperatureConverterEvent {
  final double value;
  final String fromUnit;
  final String toUnit;
  final ConversionDirection conversionDirection;

  ConvertTemperature({
    required this.value,
    required this.fromUnit,
    required this.toUnit,
    required this.conversionDirection,
  });
}
