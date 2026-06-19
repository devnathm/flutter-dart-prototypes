import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: APIScreen());
  }
}

class APIScreen extends StatefulWidget {
  const APIScreen({super.key});

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  String serverData = "No data yet.";
  bool isLoading = false;

  Future<void> fetchMockData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users/0');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        String fetchedName = jsonResponse['name'];

        setState(() {
          serverData = "Success : Data found for user $fetchedName";
          isLoading = false;
        });
      } else {
        setState(() {
          serverData = "Error : Server responded with ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        serverData = "Error : Could not connect.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Fetch Prototype")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            isLoading ? CircularProgressIndicator() : Text(serverData),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                fetchMockData();
              },
              child: Text("Fetch Data"),
            ),
          ],
        ),
      ),
    );
  }
}
