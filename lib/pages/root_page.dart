import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/pages/home/home_page.dart';
import 'package:university_management/pages/marks/marks_page.dart';
import 'package:university_management/pages/profile/profile_page.dart';
import 'package:university_management/pages/schedule/schedule_page.dart';
import 'package:university_management/provider/other/navigation_bar_provider.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';
import 'package:university_management/widgets/custom_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationBarProvider>(context);
    final mySubjectsProvider = Provider.of<MySubjectsProvider>(context);
    final todaySchedule = Provider.of<TodayScheduleProvider>(context);
    List<Widget> pages = [
       ProfilePage(
        mySubjects: mySubjectsProvider,
       ),
      MarksPage(
        mySubjectsProvider: mySubjectsProvider,
      ),
      const SchedulePage(),
      HomePage(
        todaySchedule: todaySchedule,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        provider: navProvider,
        mySubjectsProvider: mySubjectsProvider,
        todaySchedule: todaySchedule,
      ),
      body: pages[navProvider.currentHomeIndex],
    );
  }
}
