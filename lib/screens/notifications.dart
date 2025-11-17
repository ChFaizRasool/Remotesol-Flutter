import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool pushEnabled = true;
  bool emailEnabled = true;
  bool appSounds = true;

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Push Notifications'),
                  value: pushEnabled,
                  activeColor: Colors.blue,
                  onChanged: (v) => setState(() => pushEnabled = v),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Email Notifications'),
                  value: emailEnabled,
                  activeColor: Colors.blue,
                  onChanged: (v) => setState(() => emailEnabled = v),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('App Sounds'),
                  value: appSounds,
                  activeColor: Colors.blue,
                  onChanged: (v) => setState(() => appSounds = v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
