import 'package:flutter/material.dart';
import 'package:temperature_converter/features/convert_temperature/presentation/screens/home/home_screen.dart';

import 'core/constants/app_colors.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.defaultColor,
      ),
      home: const HomeScreen(),
    );
  }
}
