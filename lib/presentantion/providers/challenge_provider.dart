import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repositories/challenge_repository.dart';

final ChallengeProvider challengeProvider = ChallengeProvider();

class ChallengeProvider extends ChangeNotifier {

  List<ChallengeModel?> challengeList = [];

  Future<void> saveChallengeStatus(bool value) async {
    challengeRepository.saveChallengeStatus(value);
  }

  Future<bool?> getChallengeStatus() async {
    return await challengeRepository.getChallengeStatus();
  }

}