// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Connect to Firebase in Week 2
            },
          ),
        ],
      ),
      body: Center(
        // TODO: Replace with a list of pets in Week 2
        child: Text('You have no pets yet. Add one!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to Add Pet Screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}