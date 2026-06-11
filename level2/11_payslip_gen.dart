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
      home: PayslipGeneratorScreen(),
    );
  }
}

class PayslipGeneratorScreen extends StatefulWidget {
  const PayslipGeneratorScreen({super.key});

  @override
  State<PayslipGeneratorScreen> createState() => _PayslipGeneratorScreenState();
}

class _PayslipGeneratorScreenState extends State<PayslipGeneratorScreen> {
  final TextEditingController basicController = TextEditingController();
  
  String payslipDetails = "Enter Basic Salary to generate payslip.";

  void generatePayslip() {
    double? basic = double.tryParse(basicController.text);
    
    if (basic == null || basic <= 0) {
      setState(() {
        payslipDetails = "Please enter a valid Basic Salary.";
      });
      return;
    }

    // The math logic from the syllabus
    double hra = basic * 0.20;
    double da = basic * 0.15;
    double ma = 600.0;
    double gross = basic + hra + da + ma;
    double it = basic * 0.05;
    double net = gross - it;

    setState(() {
      payslipDetails = '''
--- PAYSLIP ---
Basic Salary:       ₹${basic.toStringAsFixed(2)}
HRA (20%):          ₹${hra.toStringAsFixed(2)}
DA (15%):           ₹${da.toStringAsFixed(2)}
Medical Allowance:  ₹${ma.toStringAsFixed(2)}
--------------------------------
Gross Salary:       ₹${gross.toStringAsFixed(2)}
Income Tax (5%):    ₹${it.toStringAsFixed(2)}
--------------------------------
NET SALARY:         ₹${net.toStringAsFixed(2)}
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payslip Generator'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: basicController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Basic Salary (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generatePayslip,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Generate Payslip', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                payslipDetails,
                style: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}