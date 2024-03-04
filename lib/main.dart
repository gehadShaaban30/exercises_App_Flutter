// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/pages/login.dart';
import 'package:flutter_application_6/pages/welcomePage.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp( options: FirebaseOptions(
      apiKey: "AIzaSyBhvJO3HhwicRVXpjSk1y9cdTwqnsDKuoI",
      appId: "1:998888666352:android:42aae7d137338e74153e35",
      messagingSenderId: "1e15c5d90cd1dab98cdd169e258bceece1e98d3855350abe4196146443bbb08a",
      projectId: "flutter-app-2e31f",
    ),);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user != null) {
      print("-------------------------------------- user is currently signed out !");
    }
    else{
      print("--------------------------------------- user is signed in !");
    }
  });
  super.initState();
}
@override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set LoginPage as the home page
    );
  }
 
}

  
