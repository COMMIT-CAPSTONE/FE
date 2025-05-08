import 'package:capstone_project/presenation/providers/splash_provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void updateScreen() => setState(() {});
  SplashProvider splashProvider = SplashProvider();

  @override
  void initState() {
    splashProvider.addListener(updateScreen);
    splashProvider.startAnimation(context);
    super.initState();
  }

  @override
  void dispose() {
    splashProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 180, height: 180, color: Colors.black),
            SizedBox(height: 25),
            Text(
              '어플리케이션 이름',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
