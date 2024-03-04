// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, file_names, use_key_in_widget_constructors, prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_6/pages/profile.dart';
import 'pullUp.dart';
import 'pushUp.dart';
import 'SetUp.dart';
import 'jumping.dart';
import 'squats.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExerciseButton(
                imagePath: 'assets/images/jumping.png',
                exerciseName: 'Jumping',
                onPressed: () {
                  // Navigate to Jumping page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => jumpingPage()),
                  );
                },
              ),
              ExerciseButton(
                imagePath: 'assets/images/setUp.jpeg',
                exerciseName: 'Sit Up',
                onPressed: () {
                  // Navigate to Sit Up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetUpPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExerciseButton(
                imagePath: 'assets/images/pullup.jpeg',
                exerciseName: 'Pull Up',
                onPressed: () {
                  // Navigate to Pull Up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PullUpPage()),
                  );
                },
              ),ExerciseButton(
                imagePath: 'assets/images/pushup.jpg',
                exerciseName: 'push Up',
                onPressed: () {
                  // Navigate to Sit Up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PushUpPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExerciseButton(
                imagePath: 'assets/images/squats.webp',
                exerciseName: 'Squats',
                onPressed: () {
                  // Navigate to Squats page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SquatsPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.purple,
        
        padding: EdgeInsets.all(8.0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Add functionality for the home icon
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                // Add functionality for the profile icon
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),);
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Add functionality for the search icon
              },
            ),
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () {
                // Add functionality for the info icon
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseButton extends StatelessWidget {
  final String imagePath;
  final String exerciseName;
  final VoidCallback onPressed;

  const ExerciseButton({
    required this.imagePath,
    required this.exerciseName,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 8.0),
          Text(
            exerciseName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
