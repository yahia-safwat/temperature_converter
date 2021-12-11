import 'package:flutter/material.dart';
import 'package:temperature_converter/functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double temp1 = 0.0;
  double temp2 = 0.0;

  bool isTemp1 = true;

  List<String> temperatures = ['Celsius', 'Fahrenheit', 'Kelvan'];

  var selectedTemp1 = 'Celsius';
  var selectedTemp2 = 'Fahrenheit';

  temp1Listener() {
    setState(() {
      try {
        temp1 = double.parse(temp1Controller.text);
      } catch (e) {
        throw Exception(e.toString());
      }
      temp2 = convert(temp1, selectedTemp1, selectedTemp2);
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
      temp1 = convert(temp2, selectedTemp2, selectedTemp1);
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
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          selectedTemp1 = value.toString();
                        });
                      },
                      value: selectedTemp1,
                      items: (temperatures).map((temperature) {
                        return DropdownMenuItem(
                          child: Text(temperature),
                          value: temperature,
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      controller: temp1Controller,
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: getSuffixText(selectedTemp1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          selectedTemp2 = value.toString();
                        });
                      },
                      value: selectedTemp2,
                      items: temperatures.map((temperature) {
                        return DropdownMenuItem(
                          child: Text(temperature),
                          value: temperature,
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      controller: temp2Controller,
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: getSuffixText(selectedTemp2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
