import 'package:capstone_project/presentantion/providers/my_challenge_provider.dart';
import 'package:capstone_project/presentantion/widgets/challenge_item_widget.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';

class MyChallengeScreen extends StatefulWidget {
  const MyChallengeScreen({super.key});

  @override
  State<MyChallengeScreen> createState() => _MyChallengeScreenState();
}

class _MyChallengeScreenState extends State<MyChallengeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await myChallengeProvider.getNowChallenge();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('MY 챌린지', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: mainTextColor
        ),),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('현재 참가중인 챌린지', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: mainTextColor
              ),),
              SizedBox(height: 5,),
              myChallengeProvider.nowChallenge != null
                  ? ChallengeItemWidget(challenge: myChallengeProvider.nowChallenge!)
                  : Text('현재 진행중인 챌린지가 아직 없어요', style: TextStyle(
                      fontSize: 18,
                      color: mainTextColor
                  ),),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 1,
                color: lightTextColor,
              ),
              SizedBox(height: 10,),
              Text('지금까지 참여한 챌린지', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor
              ),),
              SizedBox(height: 5,),
              myChallengeProvider.completedChallenges.isNotEmpty
                  ? Column(
                children: [
                  ...myChallengeProvider.completedChallenges.map((e) {
                    if(e['challenge'] != myChallengeProvider.nowChallenge) {
                      return ChallengeItemWidget(challenge: e['challenge'], click: false,);
                    } else {
                      return SizedBox.shrink();
                    }
                  },)
                ],
              ) : Text('지금까지 참여한 챌린지가 아직 없어요', style: TextStyle(
                          fontSize: 18,
                          color: mainTextColor
                      ),),
            ],
          ),
        ),
      ),
    ));
  }
}
