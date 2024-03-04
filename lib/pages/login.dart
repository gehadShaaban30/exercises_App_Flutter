// ignore_for_file: library_private_types_in_public_api, avoid_print, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_6/pages/welcomePage.dart';
import 'signup.dart'; // Import your signup page file
import 'forgetPassword.dart'; // Import your forget password page file
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true; // Initially hide the password
  bool _rememberMe = false;
  bool _emailError = false; // Track if email is empty
  bool _passwordError = false; // Track if password is empty

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
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError
                      ? (emailController.text.isEmpty
                          ? 'Email cannot be empty'
                          : 'Email should end with @gmail.com')
                      : null, // Show error indicator
                  filled: true,
                  fillColor: Color.fromARGB(213, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError ? 'Password cannot be empty' : null, // Show error indicator
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.purple,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to forget password page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgetPasswordPage()),
                      );
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // Replace this with your authentication logic
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Check if email and password are empty
                  setState(() {
                    _emailError = email.isEmpty || !email.endsWith('@gmail.com');
                    _passwordError = password.isEmpty;
                  });

                  // Example: Check if the email and password are correct
                  if (email.isNotEmpty && password.isNotEmpty && !(_emailError)) {
                    try {
                      // Sign in with email and password
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // Authentication successful
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      print('Login successful. Email: $email');
                    } on FirebaseAuthException catch (e) {
                      // Handle specific Firebase Auth exceptions
                      print('Error during login: $e');
                      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                        // Display error message for user not found or wrong password
                        print('Email or password is not correct.');
                      } else {
                        // Handle other errors
                        print('Error during login: $e');
                      }
                    }
                  } else {
                    // Authentication failed
                    print('Invalid email or password.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: const Text('Login', style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  // Navigate to the signup page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
