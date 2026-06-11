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
      home: LeapYearScreen(),
    );
  }
}

class LeapYearScreen extends StatefulWidget {
  const LeapYearScreen({super.key});

  @override
  State<LeapYearScreen> createState() => _LeapYearScreenState();
}

class _LeapYearScreenState extends State<LeapYearScreen> {

  final TextEditingController yearController = TextEditingController();

  String result = "Enter a year";

  void checkLeapYear() {
    int? year = int.tryParse(yearController.text);

    if (year != null) {

      bool isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

      setState(() {
        if (isLeap) {
          result = "The year $year was a leap year";
        } else {
          result = "The year $year was not a leap year";
        }
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
        title: const Text("Leap Year Checker"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Year (e.g., 2024)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkLeapYear,
              child: const Text('Check Year'),
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