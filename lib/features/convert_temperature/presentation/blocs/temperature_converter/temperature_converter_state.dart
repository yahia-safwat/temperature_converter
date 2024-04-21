part of 'temperature_converter_bloc.dart';

sealed class TemperatureConverterState extends Equatable {}

final class TemperatureConverterInitial extends TemperatureConverterState {
  @override
  List<Object> get props => [];
}

class TemperatureConverterLoading extends TemperatureConverterState {
  @override
  List<Object> get props => [];
}

class TemperatureConverterSuccess extends TemperatureConverterState {
  final double enteredvalue;
  final double convertedValue;
  final String unit;
  final TemperatureField field;

  TemperatureConverterSuccess({
    required this.enteredvalue,
    required this.convertedValue,
    required this.unit,
    required this.field,
  });

  @override
  List<Object> get props => [enteredvalue, convertedValue, unit, field];
}
