import 'package:capstone_project/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "team commit rlatpghks",
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}
