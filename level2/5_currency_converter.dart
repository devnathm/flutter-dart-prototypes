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
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController amountController = TextEditingController();
  
  String inputCurrency = 'INR';
  String outputCurrency = 'USD';
  String result = "Enter amount and press Convert";
  
  // The syllabus-defined exchange rate
  final double exchangeRate = 87.0; 

  void convertCurrency() {
    double? amount = double.tryParse(amountController.text);
    
    if (amount == null) {
      setState(() {
        result = "Please enter a valid number";
      });
      return;
    }

    double convertedAmount = 0;

    if (inputCurrency == 'INR' && outputCurrency == 'USD') {
      convertedAmount = amount / exchangeRate;
    } else if (inputCurrency == 'USD' && outputCurrency == 'INR') {
      convertedAmount = amount * exchangeRate;
    } else {
      convertedAmount = amount; // If they select INR to INR or USD to USD
    }

    setState(() {
      result = "Converted: ${convertedAmount.toStringAsFixed(2)} $outputCurrency";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Currency Converter"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: inputCurrency,
                  items: <String>['INR', 'USD'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      inputCurrency = newValue!;
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: outputCurrency,
                  items: <String>['INR', 'USD'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      outputCurrency = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convert'),
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