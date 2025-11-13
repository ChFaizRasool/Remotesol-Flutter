import 'package:flutter/material.dart';
import 'course_modules.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;

  const CourseDetailScreen({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: width * 0.35,
          height: 45,
          fit: BoxFit.contain,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/course1.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Course Title
            Text(
              courseName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Instructor Info
            const Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/instructor.png'),
                ),
                SizedBox(width: 10),
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              "This course will help you master the fundamentals of Flutter development with real-world examples and hands-on exercises. Learn to build beautiful, responsive, and high-performance mobile applications.",
              style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 25),

            // Button to go to modules
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseModulesScreen(courseName: courseName),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text(
                  "Start Course",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
