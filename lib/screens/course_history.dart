import 'package:flutter/material.dart';

class CourseHistoryScreen extends StatelessWidget {
  const CourseHistoryScreen({super.key});

  // Example static history data — you can replace with real data or SharedPreferences later
  final List<Map<String, String>> history = const [
    {"title": "Flutter Basics", "date": "2025-10-10", "status": "Completed"},
    {"title": "Advanced Dart", "date": "2025-11-02", "status": "In progress"},
    {"title": "Python for Data", "date": "2025-11-08", "status": "Not started"},
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
        title: Image.asset('assets/images/logo.png', width: width * 0.35, height: 45, fit: BoxFit.contain),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: history.isEmpty
            ? const Center(child: Text('No history yet', style: TextStyle(color: Colors.grey)))
            : ListView.separated(
                itemCount: history.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = history[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: item['status'] == 'Completed' ? Colors.green : Colors.blue,
                        child: const Icon(Icons.check, color: Colors.white),
                      ),
                      title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Date: ${item['date']}'),
                      trailing: Text(item['status']!, style: const TextStyle(color: Colors.grey)),
                      onTap: () {
                        // optional: navigate to course detail or module position
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Open ${item['title']}')),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
