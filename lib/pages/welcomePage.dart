// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, file_names, use_key_in_widget_constructors, prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
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
              ),
              ExerciseButton(
                imagePath: 'assets/images/pushup.jpg',
                exerciseName: 'Push Up',
                onPressed: () {
                  // Navigate to Push Up page
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple),
            label: '', // Remove the label for the "Home" icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.purple),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.purple),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.purple),
            label: 'Info',
          ),
        ],
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
