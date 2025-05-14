import 'package:flutter/material.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('asdf'),
        centerTitle: true,
      ),
      body: Column(children: [

      ]),
    );
  }
}
