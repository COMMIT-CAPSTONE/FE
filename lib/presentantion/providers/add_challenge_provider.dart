import 'package:capstone_project/data/models/challenge_model.dart';
import 'package:capstone_project/data/repositories/challenge_repository.dart';
import 'package:capstone_project/presentantion/providers/challenge_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddChallengeProvider extends ChangeNotifier {

  String challengeType = 'G';
  final TextEditingController pointController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final DateTime nowDate = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool choiceStartDay = false;

  DateTime? startDay;
  DateTime? lastDay;

  void setChallengeType(String type) {
    challengeType = type;
    notifyListeners();
  }

  void daySelect(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay, selectedDay)) {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
      notifyListeners();
    }
  }

  void pageChange(DateTime focusedDay) {
    this.focusedDay = focusedDay;
  }

  void changeDay() {
    choiceStartDay = !choiceStartDay;
    notifyListeners();
  }

  void resetDay() {
    choiceStartDay = false;
    selectedDay = nowDate;
    startDay = null;
    lastDay = null;
    notifyListeners();
  }

  void setStartDay() {
    startDay = selectedDay;
    notifyListeners();
  }

  void setLastDay() {
    if (startDay!.year < selectedDay.year ||
        (startDay!.year == selectedDay.year &&
            (startDay!.month < selectedDay.month ||
                (startDay!.month == selectedDay.month &&
                    startDay!.day <= selectedDay.day)))) {
      lastDay = selectedDay;
    } else {
      selectedDay = startDay!;
      changeDay();
    }
    notifyListeners();
  }

  void addChallenge(BuildContext context) {
    if(titleController.text.isNotEmpty && pointController.text.isNotEmpty && timeController.text.isNotEmpty && startDay != null && lastDay != null) {
      final newChallenge = ChallengeModel(
          writer: '작성자',
          challengeName: titleController.text,
          challengeType: challengeType,
          point: int.parse(pointController.text),
          exerciseTime: int.parse(timeController.text),
          startDay: startDay!,
          lastDay: lastDay!);
      challengeProvider.challengeList.add(newChallenge);
      challengeRepository.addChallenge(newChallenge);
      challengeProvider.saveChallengeStatus(true);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 항목이 입력되어야 합니다.'))
      );
    }
  }

}