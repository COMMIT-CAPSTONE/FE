import 'package:capstone_project/screens/auth/signin_screen.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white
        )
      ),
      home: SigninScreen(),
    );
  }
}
