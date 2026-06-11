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
      home: FactorialScreen(),
    );
  }
}

class FactorialScreen extends StatefulWidget {
  const FactorialScreen({super.key});

  @override
  State<FactorialScreen> createState() => _FactorialScreenState();
}

class _FactorialScreenState extends State<FactorialScreen> {

  final TextEditingController numberController = TextEditingController();

  String result = "Enter a positive number";

  void calculateFactorial() {
      int? number = int.tryParse(numberController.text);

      // Added a limit of 20 to prevent integer overflow
      if (number != null && number >= 0 && number <= 20) {
        int factorial = 1;

        for (int i = 1; i <= number; i++) {
          factorial = factorial * i;
        }

        setState(() {
          result = "Factorial of $number is $factorial";
        });
      } else if (number != null && number > 20) {
        setState(() {
          result = "Number too large! Try 20 or less.";
        });
      } else {
        setState(() {
          result = "Please enter a valid positive integer";
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Factorial Calculator"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Number (e.g., 5)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFactorial,
              child: const Text('Calculate Factorial'),
            ),
            const SizedBox(height: 30),
            Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}