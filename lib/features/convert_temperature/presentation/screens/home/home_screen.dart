import 'package:flutter/material.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/dropdown_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double temp1 = 0.0;
  double temp2 = 0.0;

  bool isTemp1 = true;

  String selectedTemp1 = 'Celsius', selectedTemp2 = 'Fahrenheit';

  List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvan'];

  var temp1Controller = TextEditingController();
  var temp2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            temp1Controller.clear();
            temp2Controller.clear();
          });
        },
        child: const Icon(Icons.clear),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownItem(
                        selectedTemp: selectedTemp1,
                        temperatures: temperatures,
                        onChanged: (value) {
                          setState(() {
                            selectedTemp1 = value.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        tempController: temp1Controller,
                        selectedTemp: selectedTemp1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownItem(
                        selectedTemp: selectedTemp2,
                        temperatures: temperatures,
                        onChanged: (value) {
                          setState(() {
                            selectedTemp2 = value.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        tempController: temp2Controller,
                        selectedTemp: selectedTemp2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
