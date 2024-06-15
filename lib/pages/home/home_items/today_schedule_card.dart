import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/models/schedule/my_schedule_model.dart';
import 'package:university_management/pages/home/home_items/subject_info_row.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({
    super.key,
    required this.secondTitle,
    required this.thirdTitle,
    required this.scheduleModel,
  });
  final String secondTitle, thirdTitle;
  final MyScheduleModel scheduleModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppColors.blueWpuColor,
                width: 2,
              ),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubjectInfoRow(
                    title: "اسم المادة :",
                    info: scheduleModel.subject.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubjectInfoRow(
                    title: "عدد المحاضرات اليوم :",
                    info: scheduleModel.subject.schedule.length.toString(),
                  ),
                  Column(
                    children: scheduleModel.subject.schedule.map((e) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SubjectInfoRow(
                            title:
                                "${scheduleModel.subject.schedule.indexOf(e) + 1} : ",
                            info:
                                "من ${e.startTime} حتى ${e.endTime} \n                قاعة : ${e.place}",
                          ),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
