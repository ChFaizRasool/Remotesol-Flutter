import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(RemoteSolApp());
}

class RemoteSolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'remotesol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.splash,
      routes: Routes.getRoutes(),
    );
  }
}
