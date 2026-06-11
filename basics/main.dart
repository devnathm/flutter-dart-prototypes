import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// --- The Engine Starter ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// --- The Unchangeable Frame ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. The Photo (Safe Placeholder)
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // 2. The Name
            const Center(
              child: Text(
                "Devnath Majhi",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // 3. The Row Requirement (Contact Info)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.grey),
                SizedBox(width: 8),
                Text("devnath.majhi17@gmail.com"),
                SizedBox(width: 16),
                Icon(Icons.phone, color: Colors.grey),
                SizedBox(width: 8),
                Text("+91 9876543210"),
              ],
            ),
            const SizedBox(height: 30),

            // 4. The Container & Text Requirements (Curriculum Vitae)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Curriculum Vitae",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    "Education:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("• B.Sc. Computer Science (Semester 3)"),
                  SizedBox(height: 15),
                  Text(
                    "Technical Skills:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("• C Programming, Dart, Flutter"),
                  Text("• HTML, CSS, JavaScript"),
                  Text("• Data Structures & Algorithms"),
                  SizedBox(height: 15),
                  Text(
                    "Projects & Interests:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("• Mobile App Development"),
                  Text("• Game Design & 3D Art"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
