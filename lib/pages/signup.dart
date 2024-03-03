// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'login.dart'; // Import your login.dart file

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true; // Initially hide the password
  bool _nameError = false; // Track if name is empty
  bool _emailError = false; // Track if email meets constraints
  bool _passwordError = false; // Track if password meets constraints

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: _nameError ? 'Name cannot be empty' : null, // Show error indicator
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError
                      ? (_emailError ? 'Email cannot be empty' : 'Email must end with @gmail.com')
                      : null, // Show error indicator
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromARGB(255, 192, 190, 190),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              if (_passwordError)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Password must contain at least one number, one uppercase and lowercase letter, and be 8 or more characters',
                    style: TextStyle(
                      color: Color.fromARGB(255, 167, 58, 48),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // Reset all error states
                  setState(() {
                    _nameError = false;
                    _emailError = false;
                    _passwordError = false;
                  });

                  // Replace this with your signup logic
                  String name = nameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Check if name is empty
                  if (name.isEmpty) {
                    setState(() {
                      _nameError = true;
                    });
                  }

                  // Check if email is empty or doesn't end with @gmail.com
                  if (email.isEmpty) {
                    setState(() {
                      _emailError = true;
                    });
                  } else if (!email.endsWith('@gmail.com')) {
                    setState(() {
                      _emailError = true;
                    });
                  }

                  // Check if password meets constraints
                  bool isPasswordValid =
                      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(password);

                  if (!isPasswordValid) {
                    setState(() {
                      _passwordError = true;
                    });
                  }

                  // Example: Check if the fields meet the criteria
                  if (!_nameError && !_emailError && !_passwordError) {
                    // Create a user map

                    // Insert user into the database

                    // For simplicity, let's print the entered data and the userId to the console
                    print('Sign Up successful, Name: $name, Email: $email');
                  } else {
                    // Show an error message or handle the case when fields are empty or do not meet criteria
                    print('Please enter all required information or check constraints.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: const Text('Sign Up', style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  // Navigate to the login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Center(
                  child: Text(
                    'Already have an account? Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
