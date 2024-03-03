// ignore_for_file: prefer_const_constructors
import 'package:flutter_application_6/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Set LoginPage as the home page
    );
  }
}

