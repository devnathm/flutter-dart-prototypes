import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TemperatureScreen(),
    );
  }
}


class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}


class _TemperatureScreenState extends State<TemperatureScreen> {

  final TextEditingController tempController = TextEditingController();


  String inputUnit = 'Celsius';
  String outputUnit = 'Fahrenheit';


  String result = "Enter temperature and press Submit";


  void convertTemperature() {
    double? temp = double.tryParse(tempController.text);

    if (temp != null) {
      double convertedTemp = 0;


      if (inputUnit == 'Celsius' && outputUnit == 'Fahrenheit') {
        convertedTemp = (temp * 9 / 5) + 32;
      } else if (inputUnit == 'Fahrenheit' && outputUnit == 'Celsius') {
        convertedTemp = (temp - 32) * 5 / 9;
      } else {
        convertedTemp = temp; // If they select Celsius to Celsius
      }

      setState(() {

        result = "Result: ${convertedTemp.toStringAsFixed(2)} $outputUnit";
      });
    } else {
      setState(() {
        result = "Please enter a valid number";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Temperature Converter"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
  
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Temperature',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("From:"),
                    DropdownButton<String>(
                      value: inputUnit,
                      items: <String>['Celsius', 'Fahrenheit'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          inputUnit = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("To:"),
                    DropdownButton<String>(
                      value: outputUnit,
                      items: <String>['Celsius', 'Fahrenheit'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          outputUnit = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

  
            ElevatedButton(
              onPressed: convertTemperature,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 30),

 
            Text(
              result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}