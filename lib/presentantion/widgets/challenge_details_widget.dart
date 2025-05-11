import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:capstone_project/presentantion/components/custom_button.dart';
import 'package:capstone_project/presentantion/providers/challenge_provider.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';

class ChallengeDetailsWidget extends StatelessWidget {
  const ChallengeDetailsWidget({super.key, required this.challenge});

  final ChallengeModel challenge;

  @override
  Widget build(BuildContext context) {

    final String startYear = (challenge.startDay.year).toString();
    final String startMonth = (challenge.startDay.month).toString();
    final String startDay = (challenge.startDay.day).toString();
    final String lastYear = (challenge.lastDay.year).toString();
    final String lastMonth = (challenge.lastDay.month).toString();
    final String lastDay = (challenge.lastDay.day).toString();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(challenge.challengeName, style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: mainTextColor,
          ), overflow: TextOverflow.ellipsis, maxLines: 2,),
          // SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(challenge.writer, style: TextStyle(
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
              Text('$startYear.${startMonth.padLeft(2, '0')}.${startDay.padLeft(2, '0')} - $lastYear.${lastMonth.padLeft(2, '0')}.${lastDay.padLeft(2, '0')}', style: TextStyle(
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
          CustomButton(title: '참가하기 ${challenge.point} P', function: () async {
            await challengeProvider.setChallengeId(challenge.id);
            challengeProvider.addParticipants(challenge.id);
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
}
