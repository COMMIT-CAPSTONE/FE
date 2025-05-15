import 'package:capstone_project/utils/send_to_backend.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> loginWithGoogle() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  try {
    final account = await _googleSignIn.signIn();
    final auth = await account?.authentication;
    final accessToken = auth?.accessToken;

    if (accessToken != null) {
      await sendToBackend(accessToken, "GOOGLE");
    }
  } catch (error) {
    print("Google 로그인 실패: $error");
  }
}