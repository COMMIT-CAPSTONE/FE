import 'package:capstone_project/data/repositories/challenge_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/challenge_model.dart';

final MyChallengeProvider myChallengeProvider = MyChallengeProvider();

class MyChallengeProvider extends ChangeNotifier {

  // 지금가지 모든 챌린지 모음
  List<Map<String, dynamic>> completedChallenges = [
    {
      'challenge' : ChallengeModel(
          writer: '잉옹앙',
          challengeName: '챌린지 A',
          challengeType: 'G',
          point: 1000,
          exerciseTime: 6,
          startDay: DateTime(2025, 4, 16),
          lastDay: DateTime(2025, 5, 1),
          id: '123456789',
          totalParticipants: 10
      ),
      'completed' : false,
      'myExerciseTime' : 5,
      'getPoint' : 0,
    },
    {
      'challenge' : ChallengeModel(
        writer: '올라라ㅏㅏ',
        challengeName: '챌린지 B',
        challengeType: 'P',
        point: 1000,
        exerciseTime: 3,
        startDay: DateTime(2025, 4, 18),
        lastDay: DateTime(2025, 4, 21),
        id: '12345678',
        // success: true,
      ),
      'completed' : true,
      'myExerciseTime' : 5,
      'getPoint' : 1000,
    }
  ];

  ChallengeModel? nowChallenge;

  Future<void> getNowChallenge() async {
    final id = await challengeRepository.getChallengeId();

    for (var e in completedChallenges) {
      if (e['challenge'].id == id) {
        nowChallenge = e['challenge'];
      }
    }
  }

}