class TemperatureConverter {
  static num convert(num value, String fromUnit, String toUnit) {
    switch ('$fromUnit:$toUnit') {
      case 'Celsius:Fahrenheit':
        return (value * 9 / 5) + 32;
      case 'Fahrenheit:Celsius':
        return (value - 32) * 5 / 9;
      case 'Celsius:Kelvin':
        return value + 273.15;
      case 'Kelvin:Celsius':
        return value - 273.15;
      case 'Fahrenheit:Kelvin':
        return (value - 32) * 5 / 9 + 273.15;
      case 'Kelvin:Fahrenheit':
        return (value - 273.15) * 9 / 5 + 32;

      // Handling same unit conversions
      case 'Celsius:Celsius':
      case 'Fahrenheit:Fahrenheit':
      case 'Kelvin:Kelvin':
        return value;
      default:
        throw ArgumentError(
            'Unsupported temperature units: $fromUnit -> $toUnit');
    }
  }
}
