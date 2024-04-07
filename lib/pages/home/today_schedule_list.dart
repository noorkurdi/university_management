
import 'package:flutter/material.dart';
import 'package:university_management/pages/home/today_schedule_card.dart';

class TodayScheduleList extends StatelessWidget {
  const TodayScheduleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TodayScheduleCard();
        },
      ),
    );
  }
}
