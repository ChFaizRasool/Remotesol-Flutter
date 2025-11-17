import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
        child: ListView(
          children: const [
            Text('About RemoteSol', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(
              'Reomtesol is a reliable technology partner providing web design, SEO, and digital marketing services to businesses globally. Our expert solutions empower companies to grow and scale effectively. Version: 1.0.0',
              style: TextStyle(height: 1.5),
            ),
            SizedBox(height: 18),
            ListTile(
              leading: Icon(Icons.link, color: Colors.blue),
              title: Text('Website'),
              subtitle: Text('https://remotesol.com'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.policy, color: Colors.blue),
              title: Text('Terms of Service'),
            ),
          ],
        ),
      ),
    );
  }
}
