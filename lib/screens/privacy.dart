import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
          children: [
            const Text('Privacy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('Data Usage'),
                      subtitle: Text('We use minimal data to provide learning features.'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Third-party Services'),
                      subtitle: Text('We may use analytics or hosting services.'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Privacy Policy'),
                      subtitle: Text('Read our full privacy policy on the website.'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
