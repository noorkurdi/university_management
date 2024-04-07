import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/pages/auth/login/login_page.dart';
import 'package:university_management/pages/home/home_page.dart';
import 'package:university_management/pages/root_page.dart';
import 'package:university_management/provider/auth/login_provider.dart';
import 'package:university_management/provider/navigation_bar_provider.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'University management',
        theme: ThemeData(
          fontFamily: AppStrings.appFont,
        ),
        home: const RootPage(),
      ),
    );
  }
}
