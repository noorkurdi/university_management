import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/models/schedule/all_schedule_model.dart';
import 'package:university_management/pages/home/home_items/subject_info_row.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.scheduleModel,
  });

  final AllSchdeuleModel scheduleModel;
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
                    title: "اليوم : ",
                    info: AppMaps.days[scheduleModel.day]!,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubjectInfoRow(
                    title: "الوقت : ",
                    info:
                        "من ${scheduleModel.startTime} حتى ${scheduleModel.endTime}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubjectInfoRow(
                    title: "القاعة : ",
                    info: scheduleModel.place,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubjectInfoRow(
                    title: "السنة :",
                    info: scheduleModel.subject.year.toString(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
