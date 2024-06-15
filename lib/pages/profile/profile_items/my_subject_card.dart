import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/models/subjects/student_subject_model.dart';

class MySubjectCard extends StatelessWidget {
  const MySubjectCard({
    super.key,
    required this.mySubject,
  });
  final MySubjectModel mySubject;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: AppColors.blueWpuColor,
        child: Center(
          child: Text(
            mySubject.subject.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: AppStrings.appFont,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ));
  }
}
