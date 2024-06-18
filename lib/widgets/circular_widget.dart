
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class Circular extends StatelessWidget {
  const Circular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: AppColors.blueWpuColor,
        ),
      );
  }
}
