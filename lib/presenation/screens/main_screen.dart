import 'package:capstone_project/presenation/screens/challenge_screen.dart';
import 'package:capstone_project/presenation/screens/community_screen.dart';
import 'package:capstone_project/presenation/screens/home_screen.dart';
import 'package:capstone_project/presenation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CommunityScreen(),
    ChallengeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'adsf',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_outlined),
              label: 'adsf',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'adsf',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'adsf',
            ),
          ],
        ),
      ),
    );
  }
}
