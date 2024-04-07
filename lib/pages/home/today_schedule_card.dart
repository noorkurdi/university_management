import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/pages/home/subject_info_row.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubjectInfoRow(
                    title: "اسم المادة :",
                    info: "subject name",
                  ),
                  SubjectInfoRow(
                    title: "وقت المادة :",
                    info: "subject time",
                  ),
                  SubjectInfoRow(
                    title: "رقم القاعة :",
                    info: "204",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
