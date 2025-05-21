class ChallengeModel {

  final String writer;
  final String challengeName;
  final String challengeType;
  final int point;
  final int exerciseTime;
  final DateTime startDay;
  final DateTime lastDay;
  int totalParticipants;
  final String id;
  // final bool success;

  ChallengeModel({
    required this.writer,
    required this.challengeName,
    required this.challengeType,
    required this.point,
    required this.exerciseTime,
    required this.startDay,
    required this.lastDay,
    this.totalParticipants = 1,
    String? id,
    // this.success = false,
  }) : id = id ?? '${DateTime.now().millisecondsSinceEpoch}';

  factory ChallengeModel.createChallenge(Map<String, dynamic> json) =>
      ChallengeModel(
        writer: json['writer'],
        challengeName: json['challengeName'],
        challengeType: json['challengeType'],
        point: json['point'],
        exerciseTime: json['exerciseTime'],
        startDay: DateTime.parse(json['startDay']),
        lastDay: DateTime.parse(json['lastDay']),
        id: json['id'].toString()
        // success: json['success']
      );

  Map<String, dynamic> toJson() {
    return {
      'writer' : writer,
      'challengeName' : challengeName,
      'challengeType' : challengeType,
      'point' : point,
      'exerciseTime' : exerciseTime,
      'startDay' : startDay,
      'lastDay' : lastDay,
      'totalParticipants' : totalParticipants,
      'id' : id,
    };
  }

}