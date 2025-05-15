import 'package:capstone_project/common/colors.dart';
import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:capstone_project/presentantion/providers/challenge_provider.dart';
import 'package:capstone_project/presentantion/widgets/challenge_details_widget.dart';
import 'package:flutter/material.dart';

class ChallengeItemWidget extends StatelessWidget {
  const ChallengeItemWidget({super.key, required this.challenge, this.click = true});

  final ChallengeModel challenge;
  final bool click;

  @override
  Widget build(BuildContext context) {

    final String startYear = (challenge.startDay.year).toString();
    final String startMonth = (challenge.startDay.month).toString();
    final String startDay = (challenge.startDay.day).toString();
    final String lastYear = (challenge.lastDay.year).toString();
    final String lastMonth = (challenge.lastDay.month).toString();
    final String lastDay = (challenge.lastDay.day).toString();

    return GestureDetector(
      onTap: click ? () async {
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
      } : () {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 18,
                      decoration: BoxDecoration(
                        color: pointColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.calendar_month, size: 12, color: pointColor,),
                          Text('총 ${challenge.exerciseTime} 시간', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: pointColor
                          ),)
                        ],
                      ),
                    ),
                    Text(challenge.challengeName, style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: mainTextColor
                    ), overflow: TextOverflow.ellipsis),
                    Text('$startYear.${startMonth.padLeft(2, '0')}.${startDay.padLeft(2, '0')} - $lastYear.${lastMonth.padLeft(2, '0')}.${lastDay.padLeft(2, '0')}', style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: lightTextColor
                    ),),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 18,
                      decoration: BoxDecoration(
                        color: lightTextColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text('${challenge.point} P', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: lightTextColor
                      ),),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //
                //     SizedBox(width: 10,),
                //     Text('$startYear.${startMonth.padLeft(2, '0')}.${startDay.padLeft(2, '0')} - $lastYear.${lastMonth.padLeft(2, '0')}.${lastDay.padLeft(2, '0')}', style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.bold,
                //         color: lightTextColor
                //     ),),
                //   ],
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
