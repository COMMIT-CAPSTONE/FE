import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:flutter/cupertino.dart';

final NotificationProvider notificationProvider = NotificationProvider();

class NotificationProvider extends ChangeNotifier {

  // 끝난 챌린지의 id를 받고 그중 어떤게 성공했는지 표시
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

}