import '../entities/temperature_entity.dart';

abstract class TemperatureRepository {
  TemperatureEntity convertTemperature(
      String value, String fromUnit, String toUnit);
}
