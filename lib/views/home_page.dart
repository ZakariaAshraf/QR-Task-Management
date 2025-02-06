import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tasky/controllers/home_controller.dart';
import 'package:tasky/views/add_task.dart';
import 'package:tasky/views/qr_scan_view.dart';

import '../componenets/task_card.dart';
import '../componenets/task_model.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
        return Scaffold(
          appBar: AppBar(
            title: Text("Tasky"),
            actions: [
              IconButton(icon:Icon(CupertinoIcons.profile_circled),onPressed: (){
                Get.toNamed("/profile");
              },),
              SizedBox(width: 12),
              IconButton(
                icon: Icon(Icons.exit_to_app_outlined),
                color: Colors.purple,
                onPressed: () async{
                  await authController.logout();
                  Get.offAllNamed("/login");
                },
              ),
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilterChip(
                        selectedColor: Colors.purple,
                        label: Text('All'),
                        selected: controller.filter == 'all',
                        onSelected: (selected) => controller.filterTasks('all'),
                      ),
                      FilterChip(
                        selectedColor: Colors.purple,
                        label: Text('in progress'),
                        selected: controller.filter == 'in progress',
                        onSelected: (selected) => controller.filterTasks('in progress'),
                      ),
                      FilterChip(
                        selectedColor: Colors.purple,
                        label: Text('waiting'),
                        selected: controller.filter == 'waiting',
                        onSelected: (selected) => controller.filterTasks('waiting'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildSection(
                        "Today",
                        controller.filteredTasks
                            .where((item) => isToday(item.timestamp))
                            .toList(),
                      ),
                      _buildSection(
                        "Older",
                        controller.filteredTasks
                            .where((item) => !isToday(item.timestamp))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => QrScanView(),));
                },
                child: Icon(CupertinoIcons.qrcode),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 15),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  Get.to(AddTask(controller.addTask));
                },
                child: Icon(CupertinoIcons.add),
                backgroundColor: Colors.purple,
              ),
            ],
          ),
        );
      },
    );
  }

  bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  Widget _buildSection(String title, List<Task> items) {
    if (items.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...items.map((item) => TaskCard(task: item)).toList(),
      ],
    );
  }}