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
      home: TourHomeScreen(),
    );
  }
}

// --- MAIN SCREEN ---
class TourHomeScreen extends StatelessWidget {
  const TourHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XYZ Tour & Travels'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // The Side Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Tourist-spots',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('View Destinations'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to XYZ Tour & Travels!\nClick the button below to view places.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      // The Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the picture screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TouristPlacesScreen(),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.photo_library, color: Colors.white),
      ),
    );
  }
}

// --- SECOND SCREEN (Pictures) ---
class TouristPlacesScreen extends StatelessWidget {
  const TouristPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Places'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // A scrollable list of network images
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.asset(
            'assets/colosseum.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/eiffel.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/louvre.webp',
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}