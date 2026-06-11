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
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String result = "0";

  void calculate(String operator) {
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    if (num1 != null && num2 != null) {
      double calcResult = 0;

      setState(() {
        if (operator == '+') {
          calcResult = num1 + num2;
        } else if (operator == '-') {
          calcResult = num1 - num2;
        } else if (operator == '*') {
          calcResult = num1 * num2;
        } else if (operator == '/') {
          if (num2 == 0) {
            result = "Cannot divide by zero";
            return; // Stops the function early
          }
          calcResult = num1 / num2;
        }
        result = "Result: $calcResult";
      });
    } else {
      setState(() {
        result = "Please enter valid numbers";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Basic Calculator"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text('-', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: const Text('*', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: const Text('/', style: TextStyle(fontSize: 24)),
                ),
              ],
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