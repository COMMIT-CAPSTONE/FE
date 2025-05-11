import 'package:capstone_project/common/colors.dart';
import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:capstone_project/presentantion/providers/challenge_provider.dart';
import 'package:capstone_project/presentantion/widgets/challenge_details_widget.dart';
import 'package:flutter/material.dart';

class ChallengeItemWidget extends StatelessWidget {
  const ChallengeItemWidget({super.key, required this.challenge});

  final ChallengeModel challenge;

  @override
  Widget build(BuildContext context) {

    final String startYear = (challenge.startDay.year).toString();
    final String startMonth = (challenge.startDay.month).toString();
    final String startDay = (challenge.startDay.day).toString();
    final String lastYear = (challenge.lastDay.year).toString();
    final String lastMonth = (challenge.lastDay.month).toString();
    final String lastDay = (challenge.lastDay.day).toString();

    return GestureDetector(
      onTap: () async {
        if(await challengeProvider.getChallengeId() == '') {
          showDialog(context: context, builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: ChallengeDetailsWidget(challenge: challenge),
            );
          },);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('이미 참여중인 챌린지가 있습니다.'))
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ))
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(challenge.challengeName, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: mainTextColor
              ), overflow: TextOverflow.ellipsis, maxLines: 2,),
            ),
            SizedBox(width: 10,),
            Text('$startYear.${startMonth.padLeft(2, '0')}.${startDay.padLeft(2, '0')} - $lastYear.${lastMonth.padLeft(2, '0')}.${lastDay.padLeft(2, '0')}', style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: lightTextColor
            ),),
          ],
        ),
      ),
    );
  }
}
