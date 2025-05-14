import 'package:capstone_project/presenation/screens/challenge_screen.dart';
import 'package:capstone_project/presenation/screens/community/community_screen.dart';
import 'package:capstone_project/presenation/screens/home_screen.dart';
import 'package:capstone_project/presenation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  final List<IconData> _icons = [
    Icons.home,
    Icons.comment,
    Icons.calendar_month,
    Icons.person,
  ];

  final List<String> _labels = ['홈', '밀리토크', '챌린지', '마이'];

  List<bool> isPressed = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0.1,
                blurStyle: BlurStyle.outer,
              ),
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              final isSelected = _currentIndex == index;

              return GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    isPressed[index] = true;
                  });
                },
                onTapUp: (_) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _currentIndex = index;
                    isPressed[index] = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isPressed[index] = false;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.transparent,
                  child: AnimatedScale(
                    scale: isPressed[index] ? 0.9 : 1.0,
                    duration: Duration(milliseconds: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _icons[index],
                          color:
                              isSelected ? Colors.purple.shade800 : Colors.grey,
                        ),
                        SizedBox(height: 1),
                        Text(
                          _labels[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            color:
                                isSelected
                                    ? Colors.purple.shade800
                                    : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

//Theme(
//             data: Theme.of(context).copyWith(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//             ),
//             child: BottomNavigationBar(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               onTap: (value) {
//                 HapticFeedback.lightImpact();
//                 setState(() {
//                   _currentIndex = value;
//                 });
//               },
//               currentIndex: _currentIndex,
//               type: BottomNavigationBarType.fixed,
//               selectedLabelStyle: TextStyle(
//                 fontSize: 13,
//                 fontFamily: 'NotoSansKR',
//                 fontWeight: FontWeight.w400,
//               ),
//               unselectedLabelStyle: TextStyle(
//                 fontSize: 13,
//                 fontFamily: 'NotoSansKR',
//                 fontWeight: FontWeight.w400,
//               ),
//               unselectedItemColor: Colors.grey,
//               selectedItemColor: Colors.purple.shade800,
//               items: [
//                 BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.comment),
//                   label: '밀리토크',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.calendar_month),
//                   label: '챌린지',
//                 ),
//                 BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
//               ],
//             ),
//           ),
