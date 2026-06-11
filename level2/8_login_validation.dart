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
      home: LoginValidationScreen(),
    );
  }
}

class LoginValidationScreen extends StatefulWidget {
  const LoginValidationScreen({super.key});

  @override
  State<LoginValidationScreen> createState() => _LoginValidationScreenState();
}

class _LoginValidationScreenState extends State<LoginValidationScreen> {
  // This key is required to trigger the validation automatically
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    // This triggers the 'validator' function inside every TextFormField
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Validation'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                // --- USERNAME RULES ---
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  if (value.length < 6) {
                    return 'Username must be at least 6 characters long'; // [cite: 132]
                  }
                  return null; // Return null if there are no errors
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true, // Hides the password dots
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                // --- PASSWORD RULES ---
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length <= 6) {
                    return 'Password must be more than 6 characters'; // [cite: 138]
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Must contain an uppercase letter'; // 
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Must contain a lowercase letter'; // [cite: 135]
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Must contain a digit'; // 
                  }
                  if (!RegExp(r'[!@#\$&*~%]').hasMatch(value)) {
                    return 'Must contain a special character'; // [cite: 137]
                  }
                  return null; // Passes all checks
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm, // 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}