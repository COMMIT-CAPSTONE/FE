import 'package:capstone_project/presentantion/screens/challenge_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:capstone_project/presentantion/screens/add_challenge_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    locale: const Locale('ko', 'KR'),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko', 'KR'), // 한글 locale 추가
    ],
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    ),
    home: ChallengeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
