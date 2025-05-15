import 'dart:async';

import 'package:capstone_project/common/colors.dart';
import 'package:capstone_project/presentantion/providers/challenge_provider.dart';
import 'package:capstone_project/presentantion/screens/add_challenge_screen.dart';
import 'package:capstone_project/presentantion/screens/my_challenge_screen.dart';
import 'package:capstone_project/presentantion/screens/notification_screen.dart';
import 'package:capstone_project/presentantion/widgets/challenge_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    challengeProvider.addListener(updateScreen);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(Duration(seconds: 10), (timer) async {
        print('웅냥냥');
        final challengeId = await challengeProvider.getChallengeId();

        for (var e in challengeProvider.challengeList) {
          if (e != null && e.id == challengeId) {
            if (DateTime.now().year == e.lastDay.year &&
                DateTime.now().month == e.lastDay.month &&
                DateTime.now().day == e.lastDay.day) {
              await challengeProvider.removeChallengeId();
            }
          }
        }
      });
    });
  }


  @override
  void dispose() {
    challengeProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('챌린지', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: mainTextColor
        ),),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  // await challengeProvider.removeChallengeId();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Icon(Icons.notifications_none_outlined, size: 28, color: mainTextColor,),
              ),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    width: (MediaQuery.sizeOf(context).width * 0.9) - 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: mainTextColor.withOpacity(0.8)
                        ),
                        labelText: '챌린지 검색',
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await challengeProvider.removeChallengeId();
                    },
                    child: Icon(Icons.search_rounded, size: 30, color: mainTextColor,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 1,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          // await challengeProvider.removeChallengeId();
                          // 미아 챌린지 부분은 화면 오류남 해결 필요함
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyChallengeScreen()));
                        },
                        child: Text('MY 챌린지', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: lightTextColor,
                        ),),
                      )
                    ],
                  ),
                  ...challengeProvider.challengeList.isNotEmpty
                      ? challengeProvider.challengeList
                      .map((e) => ChallengeItemWidget(challenge: e!))
                      : [Text('할 수 있는 챌린지가 아직 없어요', style: TextStyle(
                    fontSize: 18,
                    color: mainTextColor
                  ),)],
                  SizedBox(height: 20,),
                ],
              ),
            ),
        
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          if(await challengeProvider.getChallengeId() == '') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddChallengeScreen())).then((value) => updateScreen(),);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('이미 참여중인 챌린지가 있습니다.'))
            );
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
          ),
          child: Icon(Icons.add, size: 38, color: Colors.white,),
        ),
      ),
    ));
  }
}
