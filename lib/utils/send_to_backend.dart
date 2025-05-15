import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendToBackend(String accessToken, String provider) async {
  final response = await http.post(
    Uri.parse("https://your-api-domain.com/auth/social-login"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "access_token": accessToken,
      "provider": provider
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    String token = data['access_token'];
    print("로그인 성공! 받은 토큰: $token");

    // TODO: 이후 해당 토큰을 SharedPreferences 등에 저장하여 사용
  } else {
    print("로그인 실패: ${response.body}");
  }
}
