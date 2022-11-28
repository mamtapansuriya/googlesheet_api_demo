import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GoogleSheetController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //Future<void> addData() {}
  void clearData() {
    idController.clear();
    nameController.clear();
    emailController.clear();
  }
}
