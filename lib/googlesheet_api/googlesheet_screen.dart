import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/googlesheet_controller.dart';
import 'package:googlesheet_api_demo/googlesheet_api/user_model.dart';
import 'package:googlesheet_api_demo/googlesheet_api/usersheetapi_class.dart';
import 'package:googlesheet_api_demo/utils/routes.dart';

class GoogleSheetScreen extends StatelessWidget {
  GoogleSheetScreen({Key? key}) : super(key: key);
  final GoogleSheetController _googleSheetController =
      Get.put(GoogleSheetController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => TextFormField(
                  controller: _googleSheetController.idController,
                  readOnly: _googleSheetController.isEdit.value ? true : false,
                  decoration: const InputDecoration(
                    labelText: 'id',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormField(
                  controller: _googleSheetController.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              TextFormField(
                controller: _googleSheetController.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          User user = User(
                              id: _googleSheetController.idController.text,
                              name: _googleSheetController.nameController.text,
                              email:
                                  _googleSheetController.emailController.text);
                          if (_googleSheetController.isEdit.value) {
                            await UserSheetApi.update(
                                _googleSheetController.idController.text,
                                user.toJson());
                          } else {
                            await UserSheetApi.insert(user.toJson());
                          }
                          _googleSheetController.isEdit.value = false;
                          _googleSheetController.clearData();
                        },
                        child: const Text("Save")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            _googleSheetController.userList?.value =
                                await UserSheetApi.getAllData();

                            Get.toNamed(Routes.userDataScreen);
                          },
                          child: const Text("GetAll")),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _googleSheetController.clearData();
                          _googleSheetController.isEdit.value = false;
                        },
                        child: const Text("Add New"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
