import 'package:flutter/material.dart';
import 'notifications.dart';
import 'privacy.dart';
import 'help_support.dart';
import 'about_app.dart';


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
        title: Image.asset('assets/images/logo.png', width: width * 0.35, height: 45, fit: BoxFit.contain),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
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
      ),
    );
  }
}
