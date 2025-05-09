import 'package:capstone_project/presenation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class AllExerciseConcerns extends StatelessWidget {
  const AllExerciseConcerns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        title: Text(
          '모든 운동고민',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(children: []),
    );
  }
}
