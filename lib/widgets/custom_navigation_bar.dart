import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/provider/other/navigation_bar_provider.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.provider,
    required this.mySubjectsProvider,
    required this.todaySchedule,
  });
  final NavigationBarProvider provider;
  final MySubjectsProvider mySubjectsProvider;
  final TodayScheduleProvider todaySchedule;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: AppColors.blueWpuColor,
      backgroundColor: Colors.transparent,
      height: kBottomNavigationBarHeight,
      index: provider.currentHomeIndex,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (value) {
        if (value == provider.currentHomeIndex) {
          return;
        }
        if (value == 1 || value == 0) {
          mySubjectsProvider.getMySubjects();
        }
        if (value == 3) {
          todaySchedule.getTodaySchedule();
        }
        provider.pageChange(value);
      },
      items: const [
        Icon(
          Icons.person,
          color: Colors.white,
        ),
        Icon(
          Icons.list_alt_rounded,
          color: Colors.white,
        ),
        Icon(
          Icons.date_range_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.home,
          color: Colors.white,
        ),
      ],
    );
  }
}
