import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("google Sheet Demo"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.googleApiScreen);
              },
              child: Text("Google Api"))
        ],
      )),
    ));
  }
}
