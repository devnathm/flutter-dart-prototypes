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

        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "APP BAR",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple[100],

          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),

        body: Center(
          child: Container(
            height: 300,
            width: 300,

            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(20),
            ),

            padding: EdgeInsets.all(25),

            child: Icon(Icons.favorite, color: Colors.white, size: 64),
          ),
        ),
      ),
    );
  }
}
