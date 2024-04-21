import '../../../../core/errors/exception.dart';
import '../../../../core/utils/temperature_converter.dart';
import '../../domain/entities/temperature_entity.dart';
import '../../domain/repositories/temperature_repository.dart';

class TemperatureRepositoryImpl implements TemperatureRepository {
  @override
  Future<TemperatureEntity> convertTemperature(
      double value, String fromUnit, String toUnit) async {
    try {
      final convertedValue =
          TemperatureConverter.convert(value, fromUnit, toUnit);
      return TemperatureEntity(convertedValue, toUnit);
    } catch (e) {
      throw TemperatureConversionException(
          message: 'Failed to convert temperature: $e');
    }
  }
}
