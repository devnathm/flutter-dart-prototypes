import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VolumeCalculatorScreen(),
    );
  }
}

class VolumeCalculatorScreen extends StatefulWidget {
  const VolumeCalculatorScreen({super.key});

  @override
  State<VolumeCalculatorScreen> createState() => _VolumeCalculatorScreenState();
}

class _VolumeCalculatorScreenState extends State<VolumeCalculatorScreen> {
  final TextEditingController sideController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();
  
  // Dropdown for cylinder height
  String selectedHeight = '10'; 
  final List<String> heightOptions = ['10', '20', '30', '40', '50'];

  String cubeResult = "Cube Volume: 0.00";
  String cylinderResult = "Cylinder Volume: 0.00";

  void calculateVolume() {
    double? side = double.tryParse(sideController.text);
    double? radius = double.tryParse(radiusController.text);
    double height = double.parse(selectedHeight);

    setState(() {
      // Cube Math
      if (side != null && side > 0) {
        double cubeVol = pow(side, 3).toDouble();
        cubeResult = "Cube Volume: ${cubeVol.toStringAsFixed(2)}";
      } else {
        cubeResult = "Cube Volume: Invalid Input";
      }

      // Cylinder Math
      if (radius != null && radius > 0) {
        double cylinderVol = pi * pow(radius, 2) * height;
        cylinderResult = "Cylinder Volume: ${cylinderVol.toStringAsFixed(2)}";
      } else {
        cylinderResult = "Cylinder Volume: Invalid Input";
      }
    });
  }

  void clearFields() {
    setState(() {
      sideController.clear();
      radiusController.clear();
      selectedHeight = '10';
      cubeResult = "Cube Volume: 0.00";
      cylinderResult = "Cylinder Volume: 0.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volume Calculator"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Cube", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: sideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Side Length',
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(height: 40, thickness: 2),
            
            const Text("Cylinder", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Radius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Select Height: ", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 20),
                DropdownButton<String>(
                  value: selectedHeight,
                  items: heightOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHeight = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calculateVolume,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
                  child: const Text('Calculate'),
                ),
                ElevatedButton(
                  onPressed: clearFields,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // Results
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                children: [
                  Text(cubeResult, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(cylinderResult, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}