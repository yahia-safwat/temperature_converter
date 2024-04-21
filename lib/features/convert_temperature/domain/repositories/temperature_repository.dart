import '../entities/temperature_entity.dart';

abstract class TemperatureRepository {
  Future<TemperatureEntity> convertTemperature(
      double value, String fromUnit, String toUnit);
}
