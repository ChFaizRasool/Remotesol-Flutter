import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;

  const CourseDetailScreen({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    // Sample modules for this course
    final List<Map<String, String>> modules = List.generate(
      5,
      (index) => {
        "title": "Module ${index + 1}",
        "duration": "${10 + index * 5} mins",
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              courseName,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video placeholder
            Container(
              height: 200,
              color: Colors.blue[100],
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Course description
            const Text(
              "Course Description",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              "This course covers all modules you need to master this subject. "
              "You can go through lessons step by step to complete the course.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Modules
            const Text(
              "Modules",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final module = modules[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(module["title"]!),
                    subtitle: Text(module["duration"]!),
                    trailing: const Icon(Icons.play_arrow, color: Colors.blue),
                    onTap: () {
                      // Add lesson navigation logic here
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
