import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasky/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Obx(() {
        if (controller.userData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(6),
                      width: 326,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NAME",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                          Text(
                            "${controller.userData['name']}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      padding: EdgeInsets.all(6),
                      width: 326,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EMAIL",
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 12),
                              ),
                              Text(
                                "${controller.userData['email']}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () async {
                                Clipboard.setData(ClipboardData(
                                  text: "${controller.userData['email']}",
                                )).then((_) {
                                  Get.snackbar('Success', 'Email copied to clipboard');
                                });
                              },
                              icon: Icon(
                               Icons.content_copy_rounded,
                                color: Colors.purple,
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      padding: EdgeInsets.all(6),
                      width: 326,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LEVEL",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                          Text(
                            "${controller.userData['level']}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      padding: EdgeInsets.all(6),
                      width: 326,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "YEARS OF EXPERIENCE",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                          Text(
                            "${controller.userData['experience']}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      padding: EdgeInsets.all(6),
                      width: 326,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LOCATION",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                          Text(
                            "${controller.userData['address']}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
