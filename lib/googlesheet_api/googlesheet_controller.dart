import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/user_model.dart';

class GoogleSheetController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  RxBool isEdit = false.obs;
  RxList<User>? userList = <User>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    clearData();
    super.onInit();
  }

  void clearData() {
    idController.clear();
    nameController.clear();
    emailController.clear();
  }
}
