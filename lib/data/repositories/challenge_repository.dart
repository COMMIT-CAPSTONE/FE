import 'dart:convert';

import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

final ChallengeRepository challengeRepository = ChallengeRepository();

class ChallengeRepository {

  final client = Client();
  final url = '';

  Future<bool> addChallenge(ChallengeModel newChallenge) async {
    try {
      final response = await client.post(
        Uri.parse(url),
        body: jsonEncode(newChallenge.toJson()),
      );

      if(response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }
      return false;
    } catch(e) {
      print('에러: $e');
      return false;
    }
  }

  Future<void> saveChallengeStatus(bool value) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool('challengeStatus', value);
  }

  Future<bool?> getChallengeStatus() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool('challengeStatus');
  }

}