import 'package:flutter/material.dart';

class CourseModulesScreen extends StatefulWidget {
  final String courseName;

  const CourseModulesScreen({super.key, required this.courseName});

  @override
  State<CourseModulesScreen> createState() => _CourseModulesScreenState();
}

class _CourseModulesScreenState extends State<CourseModulesScreen> {
  List<Map<String, dynamic>> modules = [
    {
      "title": "Introduction to Flutter",
      "duration": "10 min",
      "completed": true,
    },
    {
      "title": "Setting Up Environment",
      "duration": "15 min",
      "completed": true,
    },
    {
      "title": "Widgets & Layouts",
      "duration": "20 min",
      "completed": false,
    },
    {
      "title": "Navigation and Routing",
      "duration": "18 min",
      "completed": false,
    },
    {
      "title": "State Management",
      "duration": "25 min",
      "completed": false,
    },
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.courseName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Course Modules",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor:
                            module['completed'] ? Colors.green : Colors.blue,
                        child: Icon(
                          module['completed'] ? Icons.check : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        module['title'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        module['duration'],
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Opening ${module['title']}...'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
