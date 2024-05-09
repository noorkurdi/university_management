
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class MySubjectCard extends StatelessWidget {
  const MySubjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: AppColors.blueWpuColor,
      child: const ListTile(
        title: Center(
          child: Text(
            "subject name",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: AppStrings.appFont,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
