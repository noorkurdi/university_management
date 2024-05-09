import 'package:flutter/material.dart';

class AppKeys {
  AppKeys._();
  static GlobalKey<FormState> loginKey = GlobalKey<FormState>();
}

class AppColors {
  AppColors._();
  static const Color kWhiteColor = Color(0xFFFFFFFF);

  static Color yelloWpuColor = const Color(0Xffffcd1d);
  static Color blueWpuColor = const Color(0Xff014fa0);
}

class AppStrings {
  AppStrings._();
  static const String appFont = "ElMessiri";
}

class AppAssets {
  AppAssets._();
  // Images
  static const String appSplashScreenPhoto =
      'assets/images/splash_screen/splash_screen.png';
  static const String splashScreenBackGround =
      'assets/images/masks/Mask_Group_5.png';
  static const String loginBackGroundPic =
      'assets/images/masks/Mask_Group_6.png';
  static const String appPhoto = 'assets/images/masks/Mask_Group_8.png';
  static const String profileBackGroundPic =
      'assets/images/masks/Mask_Group_15.png';
  static const String wpuLogo = 'assets/images/logo/wpu_logo.png';
  static const String numbersIcon = 'assets/images/icons/numbers_svg.svg';
  static const String collageIcon = 'assets/images/icons/collage.svg';
  static const String profileImage = 'assets/images/profile.png';
}

class AppMaps {
  AppMaps._();
  static const Map<int, String> date = {
    1: 'الاثنين',
    2: 'الثلاثاء',
    3: 'الأربعاء',
    4: 'الخميس',
    5: 'الجمعة',
    6: 'السبت',
    7: 'الأحد',
  };
}

class AppLists {
  AppLists._();

  static const List<String> years = [
    "الأولى",
    "الثانية",
    "الثالثة",
    "الرابعة",
    "الخامسة",
    "الكل",
  ];
}
