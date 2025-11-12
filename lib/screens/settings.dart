import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: ListView(
          children: [
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: const Text("Profile"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.blue),
                    title: const Text("Change Password"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Change Password Screen
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Preferences",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.blue),
                    title: const Text("Notifications"),
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {
                        // Handle toggle
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.lock_outline, color: Colors.blue),
                    title: const Text("Privacy"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Privacy Screen
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "About",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.blue),
                    title: const Text("App Version"),
                    trailing: const Text("1.0.0", style: TextStyle(color: Colors.grey)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.blue),
                    title: const Text("Help & Support"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to Help Screen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
