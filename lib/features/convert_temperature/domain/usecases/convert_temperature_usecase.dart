import '../entities/temperature_entity.dart';
import '../repositories/temperature_repository.dart';

class ConvertTemperatureUseCase {
  final TemperatureRepository repository;

  ConvertTemperatureUseCase({required this.repository});

  Future<TemperatureEntity> call({
    required double value,
    required String fromUnit,
    required String toUnit,
  }) async {
    final convertedTemperature =
        await repository.convertTemperature(value, fromUnit, toUnit);
    return convertedTemperature;
  }
}
