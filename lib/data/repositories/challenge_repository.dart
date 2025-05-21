import 'dart:convert';

import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

final ChallengeRepository challengeRepository = ChallengeRepository();

class ChallengeRepository {

  final client = Client();
  final url = 'https://run.mocky.io/v3/01432482-bd4c-4788-ad74-dd2b49ca7706';

  Future<List<ChallengeModel?>> getChallenges() async {
    try {
      
      final response = await client.get(
        Uri.parse(url),
      );

      if(response.statusCode >= 200 && response.statusCode < 300) {
        final jsonBody = await jsonDecode(response.body);
        final List<ChallengeModel> challengeList = [];
        for(var challenge in jsonBody['challenges']) {
          challengeList.add(ChallengeModel.createChallenge(challenge));
        }

        return challengeList;
      }

      print('챌린지 모두 가져오기 에러 코드: ${response.statusCode}');
      return [];
      
    } catch(e) {
      print('챌린지 모두 가져오기 에러다: $e');
      return [];
    }
  }

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