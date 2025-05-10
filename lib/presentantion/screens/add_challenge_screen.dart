import 'package:capstone_project/common/colors.dart';
import 'package:capstone_project/presentantion/providers/add_challenge_provider.dart';
import 'package:capstone_project/presentantion/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddChallengeScreen extends StatefulWidget {
  AddChallengeScreen({super.key});

  final AddChallengeProvider provider = AddChallengeProvider();

  @override
  State<AddChallengeScreen> createState() => _AddChallengeWidgetState();
}

class _AddChallengeWidgetState extends State<AddChallengeScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.provider.addListener(updateScreen);
  }

  @override
  void dispose() {
    widget.provider.timeController.dispose();
    widget.provider.pointController.dispose();
    widget.provider.titleController.dispose();
    widget.provider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('챌린지 생성', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: mainTextColor
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              children: [
                Row(
                  children: [
                    _challengeType('P', '개인 챌린지', context),
                    Spacer(),
                    _challengeType('G', '그룹 챌린지', context),
                  ],
                ),
                TableCalendar(
                  firstDay: widget.provider.nowDate,
                  lastDay: DateTime.utc(widget.provider.nowDate.year + 1, widget.provider.nowDate.month, widget.provider.nowDate.day),
                  focusedDay: widget.provider.focusedDay,
                  calendarFormat: widget.provider.calendarFormat,
                  currentDay: widget.provider.startDay ?? widget.provider.selectedDay,
                  locale: 'ko_KR',
                  daysOfWeekHeight: 20,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Color(0xFFDA9F9F),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFFC05C5C),
                      shape: BoxShape.circle,
                    )
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(widget.provider.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    widget.provider.lastDay == null
                        ? widget.provider.daySelect(selectedDay, focusedDay)
                        : null;
                  },
                  // 화면이 새로고침 되더라도 사용자가 이동한 달이 유지되도록 focusedDay를 그 달 1로 일단 지정함
                  onPageChanged: (focusedDay) {
                    widget.provider.pageChange(focusedDay);
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    widget.provider.lastDay == null ? SizedBox(
                      width: 160,
                      child: CustomButton(title: widget.provider.choiceStartDay ? '마지막 날 정하기' : '시작일 정하기', function: () {
                        widget.provider.choiceStartDay ? widget.provider.setLastDay() : widget.provider.setStartDay();
                        widget.provider.changeDay();
                      }),
                    ) : SizedBox.shrink(),
                    Spacer(),
                    SizedBox(
                      width: widget.provider.lastDay == null ? 150 : MediaQuery.sizeOf(context).width * 0.9,
                      child: CustomButton(title: '다시 설정하기', function: () {
                        widget.provider.resetDay();
                      }),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                _customTextField(label: '챌린지 이름', text: null, controller: widget.provider.titleController, keyboardType: TextInputType.text),
                SizedBox(height: 15,),
                _customTextField(label: '등록 포인트', text: '포인트', controller: widget.provider.pointController, keyboardType: TextInputType.number),
                SizedBox(height: 15,),
                _customTextField(label: '총 운동 시간', text: '시간', controller: widget.provider.timeController, keyboardType: TextInputType.number),
                SizedBox(height: 20,),
                CustomButton(title: '챌린지 생성하기', function: () {
                  widget.provider.addChallenge(context);
                })
              ],
            ),
          ),
        ),
      ),
    ),);
  }

  GestureDetector _challengeType(String selectType, String text, BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.provider.setChallengeType(selectType);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: selectType == widget.provider.challengeType ? pointColor : Colors.white,
          border: selectType == widget.provider.challengeType ? null : Border.all(color: Colors.black, width: 1),
        ),
        child: Text(text, style: TextStyle(
          fontSize: 15,
          color: selectType == widget.provider.challengeType ? Colors.white : Colors.black
        ),),
      ),
    );
  }

  Row _customTextField({ required String label, required String? text, required TextEditingController controller, required TextInputType keyboardType}) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: text != null ? (MediaQuery
              .sizeOf(context)
              .width * 0.9) - 26 - 70 : MediaQuery.sizeOf(context).width * 0.9,
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            style: TextStyle(
              fontSize: 18,
              color: mainTextColor,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              labelText: label,
              labelStyle: TextStyle(
                fontSize: 18,
                color: mainTextColor,
              ),
            ),
          ),
        ),
        Spacer(),
        text != null ? Text(text, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: mainTextColor,
        ),) : SizedBox.shrink(),
        Spacer(),
      ],
    );
  }
}
