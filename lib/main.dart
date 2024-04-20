import 'package:flutter/material.dart';
import 'package:temperature_converter/screens/home_screen.dart';
import 'package:temperature_converter/shared/style/color.dart';

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
        primaryColor: defaultColor,
      ),
      home: const HomeScreen(),
    );
  }
}
