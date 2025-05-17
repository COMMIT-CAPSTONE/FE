import 'package:capstone_project/presenation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class LocationRegisterScreen extends StatelessWidget {
  const LocationRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Icon(Icons.search, size: 20),
              ),
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
      body: Column(
        children: [
          Expanded(
            child: KakaoMap(
              center: LatLng(37.5665, 126.9780),
              onMapCreated: (controller) => controller,
            ),
          ),
        ],
      ),
    );
  }
}
