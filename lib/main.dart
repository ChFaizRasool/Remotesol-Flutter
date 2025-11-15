import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash.dart';
import 'screens/login.dart'; // make sure this screen exists

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Step 2: Check login status
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(RemoteSolApp(isLoggedIn: isLoggedIn));
}

class RemoteSolApp extends StatelessWidget {
  final bool isLoggedIn;

  const RemoteSolApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemoteSol Courses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      // Step 2: Auto redirect based on login status
      home: isLoggedIn ? const SplashScreen() : const LoginScreen(),
    );
  }
}
