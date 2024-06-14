import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/pages/home/home_page.dart';
import 'package:university_management/pages/marks/marks_page.dart';
import 'package:university_management/pages/profile/profile_page.dart';
import 'package:university_management/pages/schedule/schedule_page.dart';
import 'package:university_management/provider/other/navigation_bar_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';
import 'package:university_management/widgets/custom_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationBarProvider>(context);
    final mySubjectsProvider = Provider.of<MySubjectsProvider>(context);
    List<Widget> pages = [
      const ProfilePage(),
      MarksPage(
        mySubjectsProvider: mySubjectsProvider,
      ),
      const SchedulePage(),
      const HomePage(),
    ];
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        provider: navProvider,
        mySubjectsProvider: mySubjectsProvider,
      ),
      body: pages[navProvider.currentHomeIndex],
    );
  }
}
