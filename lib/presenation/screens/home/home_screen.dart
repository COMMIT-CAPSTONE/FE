import 'package:capstone_project/common/url.dart';
import 'package:capstone_project/presenation/components/custom_swiper.dart';
import 'package:capstone_project/presenation/screens/location_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _blockScrollOnce = false;

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void handleTap(int index) {
    switch (index) {
      case 0:
        _launchURL(url0);
        break;
      case 1:
        _launchURL(url1);
        break;
      case 2:
        _launchURL(url2);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // AppBar 고정
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'millionz',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationRegisterScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.pin_drop_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 배경 내용 (스크롤되는 위쪽 영역 등)
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '안녕하세요 추승주님!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text('오늘도 기록을 남겨볼까요?', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.75,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification) {
                    final scrollPosition = scrollController.position;
                    if (scrollPosition.pixels <=
                            scrollPosition.minScrollExtent &&
                        notification.scrollDelta! < 0) {
                      if (!_blockScrollOnce) {
                        _blockScrollOnce = true;
                        return true;
                      }
                    }
                  } else {
                    _blockScrollOnce = false;
                  }
                  return false;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 5,
                        color: Colors.transparent,
                      ),
                      Center(
                        child: Container(
                          width: 35,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.transparent,
                      ),
                      CustomSwiper(
                        items: List.generate(3, (index) {
                          return Image.asset(
                            'assets/images/banner${index + 1}.png',
                            fit: BoxFit.cover,
                          );
                        }),
                        height: 100,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        onTap: (index) => handleTap(index),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.red,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.purple,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.green,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:capstone_project/presenation/screens/location_register_screen.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.yellow.shade200,
//         // backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           scrolledUnderElevation: 0,
//           title: Text(
//             'millionz',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontFamily: 'NotoSansKR',
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LocationRegisterScreen(),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.pin_drop_outlined),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.notifications_outlined),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 30,
//                           decoration: BoxDecoration(
//                             color: Colors.purple,
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '뉴비',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 13,
//                                 fontFamily: 'NotoSansKR',
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           '추승주',
//                           style: TextStyle(
//                             color: Colors.purple,
//                             fontSize: 17,
//                             fontFamily: 'NotoSansKr',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               '00h 00m 기록',
//                               style: TextStyle(
//                                 color: Colors.purple,
//                                 fontSize: 20,
//                                 fontFamily: 'NotoSansKR',
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 width: 25,
//                                 height: 25,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(40),
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: Icon(Icons.arrow_forward, size: 15),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                     : 100, height: 100, color: Colors.red),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 900,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:capstone_project/presenation/screens/all_exercise_concerns.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int number = 4;
//   String username = '안녕';
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'My Health DATA',
//             style: TextStyle(
//               color: Colors.red,
//               fontSize: 20,
//               fontFamily: 'NotoSans',
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list))],
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     width: double.infinity,
//                     height: 250,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: 'NotoSansKR',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: '$username 님의 운동 고민 ',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   TextSpan(
//                                     text: '$number',
//                                     style: TextStyle(color: Colors.red),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => AllExerciseConcerns(),
//                                   ),
//                                 );
//                               },
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     '전체보기',
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 15,
//                                       fontFamily: 'NotoSansKR',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.keyboard_arrow_right_rounded,
//                                     color: Colors.grey,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         SizedBox(
//                           width: 400,
//                           height: 160,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 3,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 width: 280,
//                                 height: 160,
//                                 margin: EdgeInsets.only(right: 12),
//                                 color: Colors.red,
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       '이번주',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'NotoSansKR',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(width: 180, height: 120, color: Colors.purple),
//                     SizedBox(width: 10),
//                     Container(width: 180, height: 120, color: Colors.purple),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(width: 180, height: 120, color: Colors.purple),
//                     SizedBox(width: 10),
//                     Container(width: 180, height: 120, color: Colors.purple),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'TOP 5',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'NotoSansKR',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     4,
//                     (_) =>
//                         Container(width: 50, height: 25, color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     width: double.infinity,
//                     height: 180,
//                     decoration: BoxDecoration(color: Colors.grey),
//                     child: Column(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     5,
//                     (_) =>
//                         Container(width: 50, height: 25, color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [Text('추천 운동'), Text('바로가기')],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: SizedBox(
//                     width: 400,
//                     height: 160,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           width: 280,
//                           height: 160,
//                           margin: EdgeInsets.only(right: 12),
//                           color: Colors.red,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
