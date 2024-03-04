// profile.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
              CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.white,
                // You can add user profile image here
              ),
              const SizedBox(height: 20.0),
              UserInfoField(label: 'User Name', value: 'John Doe'),
              UserInfoField(label: 'Email', value: 'john.doe@example.com'),
              UserInfoField(label: 'Age', value: '25'),
              UserInfoField(label: 'Gender', value: 'Male'),
              UserInfoField(label: 'Phone Number', value: '+1234567890'),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for the "Edit Profile" button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    child: const Text('Edit Profile', style: TextStyle(fontSize: 18.0)),
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

class UserInfoField extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoField({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
