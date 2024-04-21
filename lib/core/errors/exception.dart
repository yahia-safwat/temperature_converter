/// Base exception class with a message
abstract class BaseException implements Exception {
  final String? message;
  BaseException(this.message);
}

/// Exception representing errors related to temperature conversion.
class TemperatureConversionException extends BaseException {
  TemperatureConversionException({required String message}) : super(message);
}
