import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() {
  runApp(const RemoteSolApp());
}

class RemoteSolApp extends StatelessWidget {
  const RemoteSolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemoteSol Courses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
