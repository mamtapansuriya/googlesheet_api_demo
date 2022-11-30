import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/userdata_screen.dart';
import 'package:googlesheet_api_demo/home_screen.dart';

import '../googlesheet_api/googlesheet_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String homeScreen = '/homeScreen';
  static const String googleApiScreen = '/googleApiScreen';
  static const String userDataScreen = '/userDataScreen';

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
  ];
}
