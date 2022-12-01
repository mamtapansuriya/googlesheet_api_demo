import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/page_indiacator/splash/splash_controller.dart';
import 'package:googlesheet_api_demo/page_indiacator/widget/custom_button.dart';
import 'package:googlesheet_api_demo/utils/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoadingScreen extends StatelessWidget {
  OnBoadingScreen({Key? key}) : super(key: key);
  final SplashController _splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292D32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Obx(
              () => PageView.builder(
                controller: _splashController.controller,
                itemCount: _splashController.onBoadingWidget.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _splashController.onBoadingWidget[index];
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _splashController.controller,
            count: 2,
            textDirection: TextDirection.ltr,
            effect: const ExpandingDotsEffect(
              dotColor: Color(0xFF696C6F),
              activeDotColor: Color(0xFF6FD289),
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Obx(
                () => _splashController.currentPageValue.value == 0.0
                    ? Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                title: "Skip",
                                onTap: () {
                                  _splashController.isNext.value = false;
                                  Get.toNamed(Routes.homeScreen);
                                },
                                buttonColor: _splashController.isNext.value
                                    ? const Color(0xFF303E3B)
                                    : const Color(0xff6FD289),
                                textColor: _splashController.isNext.value
                                    ? const Color(0xFF6FD289)
                                    : Colors.white),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomButton(
                                title: "Next",
                                onTap: () {
                                  _splashController.isNext.value = true;
                                  _splashController.gotoNextPage();
                                },
                                buttonColor: _splashController.isNext.value
                                    ? const Color(0xff6FD289)
                                    : const Color(0xFF303E3B),
                                textColor: _splashController.isNext.value
                                    ? Colors.white
                                    : const Color(0xFF6FD289)),
                          ),
                        ],
                      )
                    : CustomButton(
                        title: "Next",
                        onTap: () {
                          //  Get.toNamed(Routes.homeScreen);
                          Get.offAllNamed(Routes.settingScreen);
                        },
                        buttonColor: const Color(0xff6FD289),
                        textColor: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
