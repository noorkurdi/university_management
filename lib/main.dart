import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/pages/auth/login/login_page.dart';
import 'package:university_management/pages/home/home_page.dart';
import 'package:university_management/pages/root_page.dart';
import 'package:university_management/provider/auth/change_email_provider.dart';
import 'package:university_management/provider/auth/change_password_provider.dart';
import 'package:university_management/provider/auth/login_provider.dart';
import 'package:university_management/provider/auth/my_details_provider.dart';
import 'package:university_management/provider/other/navigation_bar_provider.dart';
import 'package:university_management/provider/schedule/schedule_provider.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';
import 'package:university_management/provider/subjects/add_subjects_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';
import 'package:university_management/provider/subjects/not_my_subjects_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyDetalisProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySubjectsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodayScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotMySubjectsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddSubjectsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeEmailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'University management',
        theme: ThemeData(
          fontFamily: AppStrings.appFont,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
