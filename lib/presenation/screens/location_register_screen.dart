import 'package:flutter/material.dart';

class LocationRegisterScreen extends StatelessWidget {
  const LocationRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: TextField(
            decoration: InputDecoration(
              prefix: Icon(Icons.search, size: 20),
              prefixIconConstraints: BoxConstraints(minWidth: 30),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: '지역, 지점명을 검색해보세요',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.percent))],
      ),
      body: Column(children: []),
    );
  }
}
