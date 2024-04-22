import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temperature_converter/business/temp_calculator.dart';
import 'package:temperature_converter/shared/components/components.dart';
import 'package:temperature_converter/shared/components/constants.dart';

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

  List<String> temperatures = [
    'Celsius',
    'Fahrenheit',
    'Kelvan',
  ];

  temp1Listener() {
    setState(() {
      try {
        temp1 = double.parse(temp1Controller.text);
      } catch (e) {
        throw Exception(e.toString());
      }
      temp2 = TempCalc.convert(temp1, selectedTemp1, selectedTemp2);
      if (isTemp1 == false) temp2Controller.text = temp2.toString();
      isTemp1 = false;
    });
  }

  temp2Listener() {
    setState(() {
      try {
        temp2 = double.parse(temp2Controller.text);
      } catch (e) {
        throw Exception(e.toString());
      }
      temp1 = TempCalc.convert(temp2, selectedTemp2, selectedTemp1);
      if (isTemp1 == true) temp1Controller.text = temp1.toString();
      isTemp1 = true;
    });
  }

  var temp1Controller = TextEditingController();
  var temp2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    temp1Controller.addListener(temp1Listener);
    temp2Controller.addListener(temp2Listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        actions: [
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
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
                      buildDropdown(
                        selectedTemp: selectedTemp1,
                        temperatures: temperatures,
                        onChanged: (value) {
                          setState(() {
                            selectedTemp1 = value.toString();
                          });
                        },
                      ),
                      buildSizedBox(sizedBoxHeight),
                      buildTextFormField(
                        context,
                        tempController: temp1Controller,
                        selectedTemp: selectedTemp1,
                      ),
                    ],
                  ),
                ),
                buildVerticalSizedBox(20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDropdown(
                        selectedTemp: selectedTemp2,
                        temperatures: temperatures,
                        onChanged: (value) {
                          setState(() {
                            selectedTemp2 = value.toString();
                          });
                        },
                      ),
                      buildSizedBox(sizedBoxHeight),
                      buildTextFormField(
                        context,
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
