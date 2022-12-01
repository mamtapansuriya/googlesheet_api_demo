import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/page_indiacator/widget/onboading_widget.dart';
import 'package:googlesheet_api_demo/utils/routes.dart';

class SplashController extends GetxController {
  final controller = PageController();
  RxDouble currentPageValue = 0.0.obs;
  RxBool isNext = false.obs;
  RxList<Widget> onBoadingWidget = <Widget>[
    const OnboadingWidget(
      imagePath2: "assets/image/Group 111.png",
      imagePath1: "assets/image/splashImage.png",
      titleText1: "Explore Nearby",
      titleText2: "Parking.",
      subtitleText:
          "We will help you to find nearby parking and park your car easily",
      secondLeft: 70,
    ),
    const OnboadingWidget(
      imagePath1: "assets/image/splashImage.png",
      imagePath2: "assets/image/onboading2Image.png",
      titleText1: "Book & Pay",
      titleText2: "Quickly & Safely.",
      subtitleText:
          "We will help you to find nearby parking and park your car easily",
      secondLeft: 100,
    ),
  ].obs;
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF292D32),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    Timer(const Duration(seconds: 5),
        () => Get.offAndToNamed(Routes.onBoadingScreen));
    controller.addListener(() {
      currentPageValue.value = controller.page!;
    });
    super.onInit();
  }

  void gotoNextPage() {
    if (currentPageValue.value == 0.0) {
      currentPageValue.value++;
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    } else {}
  }
}
