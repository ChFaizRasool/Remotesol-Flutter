import 'package:flutter/material.dart';
import 'package:remotesol/screens/about_app.dart';
import 'package:remotesol/screens/help_support.dart';
import 'package:remotesol/screens/notifications.dart';
import 'package:remotesol/screens/privacy.dart';
import 'course_detail.dart';
import 'profile.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  // Track bookmarked courses globally
  final Set<int> bookmarkedIndices = {};

  @override
  void initState() {
    super.initState();
    _pages = [
  DashboardTab(bookmarkedIndices: bookmarkedIndices),
  const CoursesTab(),
  BookmarksTab(bookmarkedIndices: bookmarkedIndices), // ✅ correct widget name
  const ProfileScreen(),
  const SettingsTab(),
];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}


/// ---------------- Dashboard Tab ----------------
class DashboardTab extends StatefulWidget {
  final Set<int> bookmarkedIndices;

  const DashboardTab({super.key, required this.bookmarkedIndices});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  final TextEditingController searchController = TextEditingController();

  // List of available categories
  final List<String> categories = [
    "All",
    "Flutter",
    "Dart",
    "Python",
    "UI/UX",
    "Data Science",
    "Machine Learning",
  ];

  // All courses data
  final List<Map<String, String>> courses = [
    {
      "title": "Flutter Basics",
      "subtitle": "Learn Flutter from scratch",
      "category": "Flutter",
      "image": "assets/images/course1.png"
    },
    {
      "title": "Advanced Dart",
      "subtitle": "Master Dart language features",
      "category": "Dart",
      "image": "assets/images/course2.png"
    },
    {
      "title": "UI/UX Design",
      "subtitle": "Design beautiful apps",
      "category": "UI/UX",
      "image": "assets/images/course3.png"
    },
    {
      "title": "Python for Data",
      "subtitle": "Data Analysis with Python",
      "category": "Python",
      "image": "assets/images/course4.png"
    },
    {
      "title": "Machine Learning Starter",
      "subtitle": "ML for beginners",
      "category": "Machine Learning",
      "image": "assets/images/course5.png"
    },
  ];

  List<Map<String, String>> filteredCourses = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    filteredCourses = courses;
  }

  void filterCourses(String query) {
    final results = courses.where((course) {
      final title = course["title"]!.toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();

    setState(() {
      filteredCourses = results;
      selectedCategory = "All"; // Reset category when searching
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == "All") {
        filteredCourses = courses;
      } else {
        filteredCourses = courses
            .where((course) => course["category"] == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          // ---------- Top Bar ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: width * 0.3,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final homeState =
                            context.findAncestorStateOfType<_HomeScreenState>();
                        homeState?._currentIndex = 2;
                        homeState?.setState(() {});
                      },
                      child: Icon(Icons.bookmark, size: 30, color: Colors.blue),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        final homeState =
                            context.findAncestorStateOfType<_HomeScreenState>();
                        homeState?._currentIndex = 3;
                        homeState?.setState(() {});
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/bitmoji.png',
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // ---------- Search Bar ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search courses...",
                        border: InputBorder.none,
                      ),
                      onChanged: filterCourses,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ---------- Categories ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => filterByCategory(category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // ---------- Courses Section ----------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CourseDetailScreen(
                            courseName: course['title']!,
                            courseImage: course['image']!, // pass the correct image
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20)),
                            child: Image.asset(
                              course['image']!,
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course['title']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  course['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              widget.bookmarkedIndices.contains(index)
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                if (widget.bookmarkedIndices.contains(index)) {
                                  widget.bookmarkedIndices.remove(index);
                                } else {
                                  widget.bookmarkedIndices.add(index);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// ---------------- Bookmarks Tab ----------------
class BookmarksTab extends StatefulWidget {
  final Set<int> bookmarkedIndices;

  const BookmarksTab({super.key, required this.bookmarkedIndices});

  @override
  State<BookmarksTab> createState() => _BookmarksTabState();
}

class _BookmarksTabState extends State<BookmarksTab> {
  final List<Map<String, String>> courses = const [
    {
      "title": "Flutter Basics",
      "subtitle": "Learn Flutter from scratch",
      "image": "assets/images/course1.png"
    },
    {
      "title": "Advanced Dart",
      "subtitle": "Master Dart language features",
      "image": "assets/images/course2.png"
    },
    {
      "title": "UI/UX Design",
      "subtitle": "Design beautiful apps",
      "image": "assets/images/course3.png"
    },
    {
      "title": "Python for Data",
      "subtitle": "Data Analysis with Python",
      "image": "assets/images/course4.png"
    },
    {
      "title": "Machine Learning Starter",
      "subtitle": "ML for beginners",
      "image": "assets/images/course5.png"
    },
  ];
  
  get width => null;

  void _removeBookmark(int courseIndex) {
    setState(() {
      widget.bookmarkedIndices.remove(courseIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkedCourses =
        widget.bookmarkedIndices.map((i) => courses[i]).toList();

    final bookmarkedList = widget.bookmarkedIndices.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: bookmarkedCourses.isEmpty
            ? const Center(
                child: Text("No bookmarked courses yet."),
              )
            : GridView.builder(
                itemCount: bookmarkedCourses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 3,
                ),
                itemBuilder: (context, index) {
                  final course = bookmarkedCourses[index];
                  final courseIndex = bookmarkedList[index];

                  return Dismissible(
                    key: Key(course['title']!),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      _removeBookmark(courseIndex);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${course['title']} removed from bookmarks"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CourseDetailScreen(
      courseName: course['title']!,
      courseImage: course['image']!, // pass the correct image
    ),
  ),
);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child: Image.asset(
                                  course['image']!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                course['title']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}


/// ---------------- Courses Tab ----------------
class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        "title": "Flutter Basics",
        "subtitle": "Learn Flutter from scratch",
        "image": "assets/images/course1.png"
      },
      {
        "title": "Advanced Dart",
        "subtitle": "Master Dart language features",
        "image": "assets/images/course2.png"
      },
      {
        "title": "UI/UX Design",
        "subtitle": "Design beautiful apps",
        "image": "assets/images/course3.png"
      },
      {
        "title": "Python for Data",
        "subtitle": "Data Analysis with Python",
        "image": "assets/images/course4.png"
      },
      {
        "title": "Machine Learning Starter",
        "subtitle": "ML for beginners",
        "image": "assets/images/course5.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                // ✅ Navigate to the course detail screen when tapped
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CourseDetailScreen(
      courseName: course['title']!,
      courseImage: course['image']!, // pass the correct image
    ),
  ),
);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          course['image']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course['title']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course['subtitle']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/// ---------------- Settings Tab ----------------
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 40),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
  ListTile(    
    leading: Icon(Icons.notifications_outlined, color: Colors.blue),
    title: Text("Notifications"),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationsScreen()),
      );
    },
  ),
  Divider(),
  ListTile(
    leading: Icon(Icons.lock_outline, color: Colors.blue),
    title: Text("Privacy"),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PrivacyScreen()),
      );
    },
  ),
  Divider(),
  ListTile(
    leading: Icon(Icons.help_outline, color: Colors.blue),
    title: Text("Help & Support"),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
      );
    },
  ),
  Divider(),
  ListTile(
    leading: Icon(Icons.info_outline, color: Colors.blue),
    title: Text("About App"),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutAppScreen()),
      );
    },
  ),
  Divider(),
]

      ),
    );
  }
}

