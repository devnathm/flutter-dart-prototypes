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
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final TextEditingController valueController = TextEditingController();
  
  String inputUnit = 'Inch';
  String resultText = "Enter a value to convert";
  String formulaText = "";

  void convertUnit() {
    double? inputValue = double.tryParse(valueController.text);

    // Validation for non-nullable entry
    if (inputValue == null) {
      setState(() {
        resultText = "Error: Please enter a valid number";
        formulaText = "";
      });
      return;
    }

    setState(() {
      if (inputUnit == 'Inch') {
        double cm = inputValue * 2.54;
        resultText = "Result: ${cm.toStringAsFixed(2)} cm";
        formulaText = "1 inch = 2.54 cm";
      } else if (inputUnit == 'Foot') {
        double cm = inputValue * 30.48;
        resultText = "Result: ${cm.toStringAsFixed(2)} cm";
        formulaText = "1 ft = 30.48 cm";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter application'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('From:'),
                    DropdownButton<String>(
                      value: inputUnit,
                      items: <String>['Inch', 'Foot'].map((String value) {
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
                const Icon(Icons.arrow_forward),
                Column(
                  children: [
                    const Text('To:'),
                    // Second dropdown locked to Centimeter to satisfy the prompt
                    DropdownButton<String>(
                      value: 'Centimeter',
                      items: <String>['Centimeter'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: null, 
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: convertUnit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Convert', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 40),
            // The two required output labels
            Text(
              resultText,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              formulaText,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}