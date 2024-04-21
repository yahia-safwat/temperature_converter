import '../entities/temperature_entity.dart';
import '../repositories/temperature_repository.dart';

class ConvertTemperatureUseCase {
  final TemperatureRepository repository;

  ConvertTemperatureUseCase({required this.repository});

  TemperatureEntity call({
    required double value,
    required String fromUnit,
    required String toUnit,
  }) {
    final convertedTemperature =
        repository.convertTemperature(value, fromUnit, toUnit);
    return convertedTemperature;
  }
}
