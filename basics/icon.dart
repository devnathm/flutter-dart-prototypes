import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Container(
            height: 300,
            width: 300,

            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(20),
            ),

            padding: EdgeInsets.all(25),

            child: Icon(Icons.festival, color: Colors.white, size: 64),
          ),
        ),
      ),
    );
  }
}
