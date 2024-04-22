import '../entities/temperature_entity.dart';
import '../repositories/temperature_repository.dart';

class ConvertTemperatureUseCase {
  final TemperatureRepository repository;

  ConvertTemperatureUseCase({required this.repository});

  TemperatureEntity call(String value, String fromUnit, String toUnit) {
    final convertedTemperature =
        repository.convertTemperature(value, fromUnit, toUnit);
    return convertedTemperature;
  }
}
