import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesheet_api_demo/googlesheet_api/googlesheet_controller.dart';
import 'package:googlesheet_api_demo/googlesheet_api/usersheetapi_class.dart';

class UserDataScreen extends StatelessWidget {
  UserDataScreen({Key? key}) : super(key: key);
  final GoogleSheetController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("User Data")),
        body: Obx(
          () => ListView.builder(
            itemCount: _controller.userList?.length,
            itemBuilder: (context, index) {
              var data = _controller.userList![index];
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(15)),
                  height: 20,
                  width: 20,
                  child: Center(
                    child: Text(data.id.toString()),
                  ),
                ),
                title: Text(data.name.toString()),
                subtitle: Text(data.email.toString()),
                trailing: SizedBox(
                  width: 80,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            _controller.isEdit.value = true;
                            _controller.idController.text = data.id.toString();
                            _controller.nameController.text =
                                data.name.toString();
                            _controller.emailController.text =
                                data.email.toString();
                            Get.back();
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          splashRadius: 20,
                          onPressed: () async {
                            await UserSheetApi.delete(data.id.toString());
                            _controller.userList?.value =
                                await UserSheetApi.getAllData();
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
