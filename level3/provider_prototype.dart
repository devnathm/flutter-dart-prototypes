import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  String userName = "Guest";

  void loginUser(String newName) {
    userName = newName;
    notifyListeners();
  }
}

void main() {
  runApp(ChangeNotifierProvider(create: (box) => UserData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentName = context.watch<UserData>().userName;

    return Scaffold(
      appBar: AppBar(title: Text("Provider Prototype")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome $currentName"),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  context.read<UserData>().loginUser("Devnath");
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
