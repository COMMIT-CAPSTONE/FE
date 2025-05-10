class ChallengeModel {

  final String writer;
  final String challengeName;
  final String challengeType;
  final int point;
  final int exerciseTime;
  final DateTime startDay;
  final DateTime lastDay;
  int totalParticipants;

  ChallengeModel({
    required this.writer,
    required this.challengeName,
    required this.challengeType,
    required this.point,
    required this.exerciseTime,
    required this.startDay,
    required this.lastDay,
    this.totalParticipants = 1
  });

  Map<String, dynamic> toJson() {
    return {
      'writer' : writer,
      'challengeName' : challengeName,
      'challengeType' : challengeType,
      'point' : point,
      'exerciseTime' : exerciseTime,
      'startDay' : startDay,
      'lastDay' : lastDay,
      'totalParticipants' : totalParticipants
    };
  }

}