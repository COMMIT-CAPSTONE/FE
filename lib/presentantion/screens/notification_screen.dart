import 'package:capstone_project/common/colors.dart';
import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:capstone_project/presentantion/providers/notification_provider.dart';
import 'package:capstone_project/presentantion/widgets/challenge_alarm_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('알람', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: mainTextColor
        ),),
      ),
      body: Center(
        child: notificationProvider.completedChallenges.isNotEmpty ? Column(
          children: notificationProvider.completedChallenges.map((e) {
            ChallengeModel challenge = e['challenge'];
            return GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    insetPadding: EdgeInsets.zero,
                    child: ChallengeAlarmWidget(e: e,),
                  );
                },);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: lightTextColor,
                    width: 1,
                  ))
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.chat_outlined, size: 20,),
                        SizedBox(width: 5,),
                        Expanded(child: Text('${challenge.challengeName} 챌린지 결과', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: mainTextColor,
                        ), overflow: TextOverflow.ellipsis),),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 25,),
                        Text('${(challenge.lastDay.year).toString().padLeft(2, '0')}.${(challenge.lastDay.month).toString().padLeft(2, '0')}.${(challenge.lastDay.day).toString().padLeft(2, '0')}', style: TextStyle(
                          fontSize: 12,
                          color: lightTextColor,
                        ),),
                      ],
                    ),
                  ],
                )
              ),
            );
          },).toList(),
        ) : Text('아직 온 알람이 없습니다.', style: TextStyle(
            fontSize: 18,
            color: mainTextColor
        ),),
      ),
    ));
  }
}
