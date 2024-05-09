import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.iconsize,
    required this.radius,
  });
  final double radius, iconsize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.blueWpuColor,
      child:  Center(
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: iconsize,
        ),
      ),
    );
  }
}
