import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:capstone_project/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../widgets/custom_social_btn.dart';

class SigninScreen extends StatefulWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final String ip = "10.0.2.2:8080"; // 안드로이드 에뮬레이터용

  SigninScreen({super.key});



  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        print("사용자가 로그인을 취소했습니다.");
        return;
      }
      final auth = await account.authentication;
      final accessToken = auth.accessToken;

      if (accessToken != null) {
        print("Google Access Token: $accessToken");
        await sendToBackend(accessToken, "GOOGLE");
      } else {
        print("Access Token을 가져오지 못했습니다.");
      }
    } catch (error) {
      print("Google 로그인 실패: $error");
    }
  }

  Future<void> sendToBackend(String accessToken, String provider) async {
    final response = await http.post(
      Uri.parse("http://$ip/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "access_token": accessToken,
        "provider": provider
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['access_token'];
      print("로그인 성공! 서버 JWT 토큰: $token");
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
    } else {
      print("백엔드 로그인 실패: ${response.body}");
    }
  }


  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "로그인",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w900
          ),
        ),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "다음 계정으로 로그인",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w800,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 30,),
            CustomSocialBtn(
                name: "구글계정으로 로그인",
                logo: Image.asset("assets/images/google_icon.png",  width: 40, height: 40,),
                backgroundColor: Colors.white,
                fontColor: Colors.black,
                onPressed: () => widget.loginWithGoogle(context)
            ),
            SizedBox(height: 10,),
            CustomSocialBtn(
              name: "네이버계정으로 로그인",
              logo: Image.asset("assets/images/naver_icon.png",  width: 40, height: 40,),
              backgroundColor: Color(0xFF00C73C),
              fontColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(height: 10,),
            CustomSocialBtn(
                name: "카카오계정으로 로그인",
                logo: Image.asset("assets/images/kakao_icon.png",  width: 40, height: 40,),
                backgroundColor: Color(0xFFFDDC3F),
                fontColor: Colors.black,
                onPressed: () {}
            ),
            SizedBox(height: 20,),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignupScreen()
                    )
                  );
                },
                child: Text(
                  "회원가입",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      color: Colors.black54
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
