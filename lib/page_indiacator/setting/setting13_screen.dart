import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF292D32),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: AppBar(
              backgroundColor: const Color(0xFF292D32),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Setting",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              actions: [
                GestureDetector(
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF212529),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFF3E4246),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/image/profileImage.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Selena Grande",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.mail,
                                  color: Color(0xFF949698),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "selenagrande@gmail.com",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF949698)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: child))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
