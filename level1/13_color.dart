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
      home: ColorChangerScreen(), 
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {

  List<Color> screenColors = [
    Colors.white,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.amber,
    Colors.purpleAccent,
  ];

  int currentIndex = 0;

  void changeColor() {
    setState(() {

      currentIndex = (currentIndex + 1) % screenColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: screenColors[currentIndex],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment 13: Color Changer"),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: changeColor,

          child: const Text(
            "Change Color", 
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}