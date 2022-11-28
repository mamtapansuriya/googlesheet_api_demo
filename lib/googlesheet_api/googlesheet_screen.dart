import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/googlesheet_controller.dart';
import 'package:googlesheet_api_demo/googlesheet_api/user_model.dart';
import 'package:googlesheet_api_demo/googlesheet_api/usersheetapi_class.dart';

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
            TextFormField(
              controller: _googleSheetController.idController,
              decoration: const InputDecoration(
                labelText: 'id',
                border: OutlineInputBorder(),
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
            ElevatedButton(
                onPressed: () async {
                  User user = User(
                      id: _googleSheetController.idController.text,
                      name: _googleSheetController.nameController.text,
                      email: _googleSheetController.emailController.text);
                  await UserSheetApi.insert(user.toJson());
                  _googleSheetController.clearData();
                },
                child: const Text("Save")),
          ],
        ),
      ),
    ));
  }
}
