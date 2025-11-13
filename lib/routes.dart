import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/forget.dart';
import 'screens/home.dart';
import 'screens/courses.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String home = '/home';
  static const String courses = '/courses';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      forgetPassword: (context) => const ForgetScreen(),
      home: (context) => const HomeScreen(),
      courses: (context) => const CoursesScreen(
        bookmarkedCourses: [],
        onBookmarkToggle: print, // dummy for route only
      ),
    };
  }
}
