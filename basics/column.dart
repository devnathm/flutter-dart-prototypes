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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(width: 300, height: 300, color: Colors.deepPurple),

            Container(width: 200, height: 200, color: Colors.deepPurple[300]),

            Container(width: 100, height: 100, color: Colors.deepPurple[100]),
          ],
        ),
      ),
    );
  }
}
