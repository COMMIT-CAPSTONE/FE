import 'package:capstone_project/widgets/custom_social_btn.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
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
              "다음 계정으로 회원가입",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w800,
                fontSize: 20
              ),
            ),
            SizedBox(height: 30,),
            CustomSocialBtn(
                name: "구글계정으로 회원가입",
                logo: Image.asset("assets/images/google_icon.png",  width: 40, height: 40,),
                backgroundColor: Colors.white,
                fontColor: Colors.black,
                onPressed: () {}
            ),
            SizedBox(height: 10,),
            CustomSocialBtn(
                name: "네이버계정으로 회원가입",
                logo: Image.asset("assets/images/naver_icon.png",  width: 40, height: 40,),
                backgroundColor: Color(0xFF00C73C),
                fontColor: Colors.white,
                onPressed: () {}
            ),
            SizedBox(height: 10,),
            CustomSocialBtn(
                name: "카카오계정으로 회원가입",
                logo: Image.asset("assets/images/kakao_icon.png",  width: 40, height: 40,),
                backgroundColor: Color(0xFFFDDC3F),
                fontColor: Colors.black,
                onPressed: () {}
            )
          ],
        ),
      ),
    );
  }
}
