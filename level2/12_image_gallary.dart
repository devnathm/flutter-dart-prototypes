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
      home: ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  // This list holds simulated "uploaded" images
  List<String> uploadedImages = [];
  int imageCounter = 0;

  // The local images
  final List<String> localAssets = [
    'assets/colosseum.jpg',
    'assets/eiffel.jpg',
    'assets/louvre.webp',
  ];

  void simulateUpload() {
    setState(() {
      // The wrap-around logic: Cycles 0, 1, 2, 0, 1, 2...
      String nextImage = localAssets[imageCounter % 3];
      uploadedImages.add(nextImage);
      imageCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 16.0, 
              runSpacing: 16.0, 
              alignment: WrapAlignment.center,
              children: uploadedImages.map((assetPath) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue, 
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),

                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: simulateUpload,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        icon: const Icon(Icons.upload),
        label: const Text('Upload Image'),
      ),
    );
  }
}