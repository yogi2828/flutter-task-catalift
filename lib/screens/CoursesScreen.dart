import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses Screen'),
      ),
      body: const Center(
        child: Text(
          'It is Courses Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}