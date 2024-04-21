part of 'temperature_converter_bloc.dart';

sealed class TemperatureConverterState extends Equatable {}

final class TemperatureConverterInitial extends TemperatureConverterState {
  @override
  List<Object> get props => [];
}

class SelectedUnitsUpdated extends TemperatureConverterState {
  final String unit1;
  final String unit2;

  SelectedUnitsUpdated({
    required this.unit1,
    required this.unit2,
  });

  @override
  List<Object> get props => [unit1, unit2];
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
