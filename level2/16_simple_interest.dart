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
      home: SimpleInterestScreen(),
    );
  }
}

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  
  // Dropdown setup for Tenure
  String selectedTenure = '1';
  final List<String> tenureOptions = ['1', '2', '3', '4', '5', '10', '15', '20'];

  String resultMessage = "Enter details and calculate";

  void calculateInterest() {
    double? principal = double.tryParse(principalController.text);
    double? rate = double.tryParse(rateController.text);
    double tenure = double.parse(selectedTenure);

    // Validation for non-nullable numeric entry
    if (principal == null || rate == null || principal < 0 || rate < 0) {
      setState(() {
        resultMessage = "Error: Please enter valid positive numbers.";
      });
      return;
    }

    // The core math
    double simpleInterest = (principal * rate * tenure) / 100;
    double totalAmount = principal + simpleInterest;

    setState(() {
      resultMessage = "Simple Interest: ₹${simpleInterest.toStringAsFixed(2)}\nTotal Amount: ₹${totalAmount.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculation'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Principal Amount (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate of Interest (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Tenure (Years): ", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 15),
                DropdownButton<String>(
                  value: selectedTenure,
                  items: tenureOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTenure = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculateInterest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Get Interest', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text(
                resultMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}