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

  Future<void> setChallengeId(String value) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('challengeId', value);

    final List<String> ids = sharedPref.getStringList('joinedChallengeIds') ?? [];
    ids.add(value);
    await sharedPref.setStringList('joinedChallengeIds', ids);
  }

  Future<String> getChallengeId() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString('challengeId') ?? '';
  }

  Future<void> removeChallengeId() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove('challengeId');
  }

  Future<List<String>> getJoinedChallengeIds() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList('joinedChallengeIds') ?? [];
  }

}