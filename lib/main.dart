import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/page_indiacator/splash/splash_controller.dart';

import 'googlesheet_api/usersheetapi_class.dart';
import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: AppBinding(),
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      initialRoute: Routes.splashScreen,
      getPages: Routes.routes,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
