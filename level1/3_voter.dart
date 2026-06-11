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
      home: VoterScreen(),
    );
  }
}

class VoterScreen extends StatefulWidget {
  const VoterScreen({super.key});

  @override
  State<VoterScreen> createState() => _VoterScreenState();
}

class _VoterScreenState extends State<VoterScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String result = "Enter your details";

  void checkEligibility() {

    int? age = int.tryParse(ageController.text);

    if (age != null) {

      if (age >= 18) {
        setState(() {
          result = "Eligible for vote";
        });
      } else {
        setState(() {
          result = "not Eligible for vote";
        });
      }
    } else {
      // If they typed letters instead of a number for their age
      setState(() {
        result = "Please enter a valid age";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Voter Eligibility"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number, // Forces the number pad
              decoration: const InputDecoration(
                labelText: 'Enter Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),  

            ElevatedButton(
              onPressed: checkEligibility,
              child: const Text('Check Eligibility'),
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