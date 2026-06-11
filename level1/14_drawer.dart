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
      home: DrawerMenuScreen(), 
    );
  }
}

class DrawerMenuScreen extends StatelessWidget {
  const DrawerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Drawer Menu"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Click the top-left icon to open the Drawer.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}