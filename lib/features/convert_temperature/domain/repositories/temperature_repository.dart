import '../entities/temperature_entity.dart';

abstract class TemperatureRepository {
  TemperatureEntity convertTemperature(
      double value, String fromUnit, String toUnit);
}
