import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/userdata_screen.dart';
import 'package:googlesheet_api_demo/home_screen.dart';
import 'package:googlesheet_api_demo/page_indiacator/onboading/onboading_screen.dart';
import 'package:googlesheet_api_demo/page_indiacator/setting/setting13_screen.dart';
import 'package:googlesheet_api_demo/page_indiacator/splash/splash_screen.dart';

import '../googlesheet_api/googlesheet_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String homeScreen = '/homeScreen';
  static const String googleApiScreen = '/googleApiScreen';
  static const String userDataScreen = '/userDataScreen';
  static const String splashScreen = '/splashScreen';
  static const String onBoadingScreen = '/onBoadingScreen';
  static const String settingScreen = '/settingScreen';

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: homeScreen,
      page: () => const HomePage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: googleApiScreen,
      page: () => GoogleSheetScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: userDataScreen,
      page: () => UserDataScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: onBoadingScreen,
      page: () => OnBoadingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: settingScreen,
      page: () => SettingScreen(),
      transition: defaultTransition,
    ),
  ];
}
