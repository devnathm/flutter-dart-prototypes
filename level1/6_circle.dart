import 'package:flutter/material.dart';
import 'dart:math'; // math library for 'pi'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircleCalculatorScreen(),
    );
  }
}

class CircleCalculatorScreen extends StatefulWidget {
  const CircleCalculatorScreen({super.key});

  @override
  State<CircleCalculatorScreen> createState() => _CircleCalculatorScreenState();
}

class _CircleCalculatorScreenState extends State<CircleCalculatorScreen> {

  final TextEditingController radiusController = TextEditingController();

  String selectedCalculation = 'Area';

  String result = "Enter radius and select calculation";

  void calculate() {
    double? radius = double.tryParse(radiusController.text);

    if (radius != null && radius >= 0) {
      double calcResult = 0;

      setState(() {
        if (selectedCalculation == 'Area') {

          calcResult = pi * radius * radius;
          // .toStringAsFixed(2) rounds it to 2 decimal places
          result = "Area: ${calcResult.toStringAsFixed(2)}"; 
        } else {

          calcResult = 2 * pi * radius;
          result = "Circumference: ${calcResult.toStringAsFixed(2)}";
        }
      });
    } else {
      setState(() {
        result = "Please enter a valid positive number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Circle Calculator"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Radius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            DropdownButton<String>(
              value: selectedCalculation,
              items: <String>['Area', 'Circumference'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(fontSize: 18)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCalculation = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculate,
              child: const Text('Calculate'),
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