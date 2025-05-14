import 'package:capstone_project/presenation/components/custom_button.dart';
import 'package:capstone_project/presenation/screens/main_screen.dart';
import 'package:capstone_project/presenation/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 190),
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(color: Colors.red),
            ),
            SizedBox(height: 30),
            Text(
              '대충 소개하는 문구',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 20,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '뭐라고 적어야 하나요 222,',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '엄청 좋은 앱이고 무조건 깔아야하는 앱!',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 200),
            CustomButton(
              text: '시작하기',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '이미 계정이 있나요?',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
