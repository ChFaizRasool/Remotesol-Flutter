import 'package:flutter/material.dart';
import 'course_detail.dart';

class BookmarksScreen extends StatefulWidget {
  final List<Map<String, String>> allCourses;
  final Set<int> bookmarkedIndices;
  final VoidCallback onBookmarksUpdated;

  const BookmarksScreen({
    super.key,
    required this.allCourses,
    required this.bookmarkedIndices,
    required this.onBookmarksUpdated,
  });

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late List<int> _bookmarkedCourseIndices;

  @override
  void initState() {
    super.initState();
    _bookmarkedCourseIndices = widget.bookmarkedIndices.toList();
  }

  void _removeBookmark(int index) {
    final int courseIndex = _bookmarkedCourseIndices[index];

    setState(() {
      widget.bookmarkedIndices.remove(courseIndex);
      _bookmarkedCourseIndices.removeAt(index);
    });

    // Notify parent (HomeScreen) that bookmarks changed
    widget.onBookmarksUpdated();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bookmark removed'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_bookmarkedCourseIndices.isEmpty) {
      return const Center(
        child: Text(
          "No bookmarks yet",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _bookmarkedCourseIndices.length,
      itemBuilder: (context, index) {
        final course = widget.allCourses[_bookmarkedCourseIndices[index]];

        return Dismissible(
          key: Key(course['title']!),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.delete, color: Colors.white, size: 30),
          ),
          onDismissed: (direction) {
            _removeBookmark(index);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Image.asset(
                course['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                course['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(course['subtitle']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        CourseDetailScreen(courseName: course['title']!),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
