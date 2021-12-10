double convert(
  double temp,
  String selectedTemp1,
  String selectedTemp2,
) {
  double convertedVal = 0.0;

  // Celsius => Celsius
  if (selectedTemp1 == 'Celsius' && selectedTemp2 == 'Celsius') {
    convertedVal = temp;
  }

  // Celsius => Fahrenheit
  if (selectedTemp1 == 'Celsius' && selectedTemp2 == 'Fahrenheit') {
    convertedVal = (temp * 9 / 5) + 32;
  }

  // Celsius => Kelvan
  if (selectedTemp1 == 'Celsius' && selectedTemp2 == 'Kelvan') {
    convertedVal = temp + 273.15;
  }

  // Fahrenheit => Celsius
  if (selectedTemp1 == 'Fahrenheit' && selectedTemp2 == 'Celsius') {
    convertedVal = (temp - 32) * (5 / 9);
  }

  // Fahrenheit => Fahrenheit
  if (selectedTemp1 == 'Fahrenheit' && selectedTemp2 == 'Fahrenheit') {
    convertedVal = temp;
  }

  // Fahrenheit => Kelvan
  if (selectedTemp1 == 'Fahrenheit' && selectedTemp2 == 'Kelvan') {
    convertedVal = (temp - 32) * (5 / 9) + 273.15;
  }

  // Kelvan => Celsius
  if (selectedTemp1 == 'Kelvan' && selectedTemp2 == 'Celsius') {
    convertedVal = temp - 273.15;
  }

  // Kelvan => Fahrenheit
  if (selectedTemp1 == 'Kelvan' && selectedTemp2 == 'Fahrenheit') {
    convertedVal = (temp - 273.15) * (9 / 5) + 32;
  }

  // Kelvan => Kelvan
  if (selectedTemp1 == 'Kelvan' && selectedTemp2 == 'Kelvan') {
    convertedVal = temp;
  }

  return convertedVal;
}

String getSuffixText(String selectedTemp) {
  if (selectedTemp == 'Celsius') {
    return 'C';
  } else if (selectedTemp == 'Fahrenheit') {
    return 'F';
  } else if (selectedTemp == 'Kelvan') {
    return 'K';
  } else {
    return '';
  }
}
