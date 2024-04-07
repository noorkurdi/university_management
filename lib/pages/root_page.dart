import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/pages/home/home_page.dart';
import 'package:university_management/pages/marks/marks_page.dart';
import 'package:university_management/pages/profile/profile_page.dart';
import 'package:university_management/pages/schedule/schedule_page.dart';
import 'package:university_management/provider/navigation_bar_provider.dart';
import 'package:university_management/widgets/custom_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationBarProvider>(context);
    List<Widget> pages = [
      const ProfilePage(),
      const MarksPage(),
      const SchedulePage(),
      const HomePage(),
    ];
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        provider: navProvider,
      ),
      body: pages[navProvider.currentHomeIndex],
    );
  }
}
