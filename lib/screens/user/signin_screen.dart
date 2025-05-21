import 'dart:convert';
import 'package:capstone_project/screens/home/home_screen.dart';
import 'package:capstone_project/screens/user/input_userdata_screen.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;

import '../../widgets/custom_social_btn.dart';

class SigninScreen extends StatefulWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final String ip = "10.0.2.2:8080"; // 안드로이드 에뮬레이터용

  SigninScreen({super.key});

  Future<bool> isFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('is_first_login') ?? true;

    if (isFirst) {
      await prefs.setBool('is_first_login', false);
    }

    return isFirst;
  }
  Future<void> afterLogin(BuildContext context) async {
    bool first = await isFirstLogin();

    if (first) {
      // 첫 로그인 시 특정 스크린으로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => InputUserdataScreen()),
      );
    } else {
      // 기존 유저는 홈 화면으로
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }

  Future<void> kakaoLogin(BuildContext context) async {
    try {
      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
      print('카카오 로그인 성공: ${token.accessToken}');

      // 사용자 정보 출력 (옵션)
      final user = await UserApi.instance.me();
      print('사용자 이메일: ${user.kakaoAccount?.email}');

      // 서버에 토큰 전송
      await sendToBackend(context, token.accessToken, "KAKAO");
    } catch (e) {
      print('카카오 로그인 실패: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("카카오 로그인 실패: $e")),
        );
      }
    }
  }

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
        await sendToBackend(context, accessToken, "GOOGLE");
      } else {
        print("Access Token을 가져오지 못했습니다.");
      }
    } catch (error) {
      print("Google 로그인 실패: $error");
    }
  }

  Future<void> sendToBackend(BuildContext context, String accessToken, String provider) async {
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
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);

      // 로그인 이후 흐름
      await afterLogin(context);  // ← 여기서 분기 처리
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
                onPressed: () => widget.kakaoLogin(context)
            ),
          ],
        ),
      ),
    );
  }
}
