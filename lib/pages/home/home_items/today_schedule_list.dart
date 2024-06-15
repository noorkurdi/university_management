import 'package:flutter/material.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/models/schedule/my_schedule_model.dart';
import 'package:university_management/pages/home/home_items/today_schedule_card.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';

class TodayScheduleList extends StatelessWidget {
  const TodayScheduleList({
    super.key,
    required this.todaySchedule,
  });
  final TodayScheduleProvider todaySchedule;
  @override
  Widget build(BuildContext context) {
    List<MyScheduleModel> schedule = todaySchedule.todaySchedule;
    if (schedule.isNotEmpty) {
      return todaySchedule.connectionEnum == ConnectionEnum.connecting
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.blueWpuColor,
              ),
            )
          : SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: schedule.length,
                itemBuilder: (context, index) {
                  return TodayScheduleCard(
                    secondTitle: "وقت المادة :",
                    thirdTitle: "القاعة :",
                    scheduleModel: schedule[index],
                  );
                },
              ),
            );
    } else {
      return Center(
        child: Text(
          "لا يوجد محاضرات اليوم",
          style: TextStyle(
            color: AppColors.blueWpuColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
