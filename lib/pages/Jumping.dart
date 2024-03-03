// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';

class jumpingPage extends StatelessWidget {
  const jumpingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Add navigation logic to go back
            Navigator.pop(context);
          },
        ),
        title: Text(
          'jumping',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true, // Center the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your push-up exercise image here
            Image.asset(
              'assets/images/jumping.png', // Replace with your image asset
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            // Add timer icon, text, and play button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer,
                  color: Color.fromARGB(255, 238, 198, 89),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '(3:00)',
                  style: TextStyle(color: Color.fromARGB(255, 250, 209, 120), fontSize: 16.0),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Add logic for the play button
                    // This could include starting a timer or some action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
