import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';

class ChallengeAlarmWidget extends StatelessWidget {
  const ChallengeAlarmWidget({super.key, required this.e});

  final Map<String, dynamic> e;

  @override
  Widget build(BuildContext context) {
    ChallengeModel challenge = e['challenge'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(challenge.challengeName, style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor,
                ), overflow: TextOverflow.ellipsis, maxLines: 2,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('시스템', style: TextStyle(
                fontSize: 12,
                color: lightTextColor,
              ),),
              SizedBox(width: 5,),
              Container(
                color: lightTextColor,
                width: 1,
                height: 12,
              ),
              SizedBox(width: 5,),
              Text('${(challenge.lastDay.year).toString().padLeft(2, '0')}.${(challenge.lastDay.month).toString().padLeft(2, '0')}.${(challenge.lastDay.day).toString().padLeft(2, '0')}', style: TextStyle(
                fontSize: 12,
                color: lightTextColor,
              ),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('총 포인트 - ', style: TextStyle(
                fontSize: 14,
                color: mainTextColor,
              ),),
              Text('${challenge.point * challenge.totalParticipants} P', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: mainTextColor,
              ),),
              Spacer(),
              Text('${challenge.totalParticipants} 명', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: mainTextColor,
              ),),
            ],
          ),
          Spacer(),
          Row(children: [
            Text('총 ${challenge.exerciseTime}시간 / ${e['myExerciseTime']}시간'),
            Spacer(),
            Text('챌린지 ${e['completed'] ? '성공' : '실패'}', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: e['completed'] ? Colors.green : Colors.red,
            ),),
          ],),
          Text(e['completed'] ? '${e['getPoint']} P를 획득 했습니다.' : '획득한 포인트가 없습니다.'),
        ],
      ),
    );
  }
}
