import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repositories/challenge_repository.dart';

final ChallengeProvider challengeProvider = ChallengeProvider();

class ChallengeProvider extends ChangeNotifier {

  List<ChallengeModel?> challengeList = [];
  ChallengeModel? myChallenge;

  Future<void> setChallengeId(String id) async {
    await challengeRepository.setChallengeId(id);
  }

  Future<String> getChallengeId() async {
    return await challengeRepository.getChallengeId();
  }

  Future<void> removeChallengeId() async {
    await challengeRepository.removeChallengeId();
  }

  void addParticipants(String id) {
    for (var e in challengeList) {
      if (e!.id == id) {
        e.totalParticipants++;
        break;
      }
    }
  }

}