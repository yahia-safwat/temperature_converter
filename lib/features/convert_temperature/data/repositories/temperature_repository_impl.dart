import '../../../../core/errors/exception.dart';
import '../../../../core/utils/temperature_converter.dart';
import '../../domain/entities/temperature_entity.dart';
import '../../domain/repositories/temperature_repository.dart';

class TemperatureRepositoryImpl implements TemperatureRepository {
  @override
  TemperatureEntity convertTemperature(
      String value, String fromUnit, String toUnit) {
    try {
      final convertedValue =
          TemperatureConverter.convert(parseNumber(value), fromUnit, toUnit);
      return TemperatureEntity(convertedValue, toUnit);
    } catch (e) {
      throw TemperatureConversionException(
          message: 'Failed to convert temperature: $e');
    }
  }
}

dynamic parseNumber(String value) {
  // Check if the value is an integer or ends with a dot (.)
  if (!value.contains('.') || value.endsWith('.')) {
    return int.tryParse(value) ?? 0;
  }
  // Otherwise, parse it as a double
  return double.tryParse(value) ?? 0.0;
}
