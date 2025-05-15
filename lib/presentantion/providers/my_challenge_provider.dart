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
          challengeName: '여기어때',
          challengeType: 'G',
          point: 1000,
          exerciseTime: 6,
          startDay: DateTime(2025, 4, 16),
          lastDay: DateTime(2025, 5, 1),
          id: '43516735',
          totalParticipants: 10
      ),
      'completed' : false,
      'myExerciseTime' : 5,
      'getPoint' : 0,
    },
    {
      'challenge' : ChallengeModel(
        writer: '올라라ㅏㅏ',
        challengeName: '이태인 바보sadfsdafsadfsdfdsfasdfsdfa',
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

  Map<String, dynamic> challengeList = {};

  // Future<void> printy() async {
  //   print('잉용');
  //   final String printData = await challengeRepository.getChallengeId();
  //   print(printData);
  //   print('앙');
  // }


  Future<void> getChallengeList() async {
    final id = await challengeRepository.getChallengeId();
    final challengeList = {
      'now' : null,
      'notNow' : [],
    };

    for (var e in completedChallenges) {
      if (e['challenge'].id == id) {
        challengeList['now'] = e['challenge'];
      } else {
        challengeList['notNow']!.add(e['challenge']);
      }
    }

    this.challengeList = challengeList;

    print('잉');
    print(challengeList['now']);
    print(challengeList['notNow']);
    print('잉');
  }

}