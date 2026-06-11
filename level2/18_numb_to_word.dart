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
      home: NumberToWordScreen(),
    );
  }
}

class NumberToWordScreen extends StatefulWidget {
  const NumberToWordScreen({super.key});

  @override
  State<NumberToWordScreen> createState() => _NumberToWordScreenState();
}

class _NumberToWordScreenState extends State<NumberToWordScreen> {
  final TextEditingController numberController = TextEditingController();
  String resultText = "Enter a number to convert";

  // The dictionary mapping digits to words
  final Map<String, String> digitToWord = {
    '0': 'Zero',
    '1': 'One',
    '2': 'Two',
    '3': 'Three',
    '4': 'Four',
    '5': 'Five',
    '6': 'Six',
    '7': 'Seven',
    '8': 'Eight',
    '9': 'Nine',
  };

  void convertToWord() {
    String input = numberController.text.trim();

    // Validation: Check for non-null and numeric-only entry
    if (input.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(input)) {
      setState(() {
        resultText = "Error: Please enter a valid numeric enrollment number.";
      });
      return;
    }

    // Build the final string
    List<String> words = [];
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      words.add(digitToWord[char]!); // The '!' promises Flutter the key exists
    }

    setState(() {
      resultText = "In word: ${words.join(' ')}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number in Word'),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enrollment Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertToWord,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Convert to Word', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text(
                resultText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}