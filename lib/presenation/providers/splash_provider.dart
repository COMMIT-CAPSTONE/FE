import 'package:capstone_project/presenation/screens/start_screen.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  void startAnimation(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartScreen()),
    );
  }
}
