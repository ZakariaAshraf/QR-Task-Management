import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/controllers/add_task_controller.dart';
import 'package:tasky/views/home_page.dart';

import '../componenets/task_model.dart';

class AddTask extends StatelessWidget {
  final Function(Task) onAdd;

  AddTask(this.onAdd);

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => controller.selectImage(),
              child: Obx(() {
                return controller.image.value != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.file(
                          controller.image.value!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 331,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.purple,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.purple,
                            ),
                            Text(
                              "Add Img",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.purple),
                            ),
                          ],
                        ),
                      );
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: controller.titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Enter title here',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Enter Description here',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: controller.priority,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Priority',
                prefixIcon: const Icon(
                  Icons.flag_outlined,
                  color: Colors.purple,
                ),
              ),
              items: controller.selectedPriority.map((task) {
                return DropdownMenuItem(
                  value: task,
                  child: Text(task),
                );
              }).toList(),
              onChanged: (value) {
                controller.priority = value as String;
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select your favorite team';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Obx(() {
              return Container(
                padding: EdgeInsets.all(6),
                width: 326,
                height: 68,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${controller.datePicked.value.toLocal().day}-${controller.datePicked.value.toLocal().month}-${controller.datePicked.value.toLocal().year}",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () async {
                        await controller.selectDate(context);
                      },
                      icon: Icon(
                        size: 40,
                        CupertinoIcons.calendar,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),
            MaterialButton(
              minWidth: 300,
              height: 49,
              color: Colors.purple,
              onPressed: () {
                if (controller.titleController.text.isNotEmpty &&
                    controller.descriptionController.text.isNotEmpty) {
                  Task task = Task(
                    title: controller.titleController.text,
                    description: controller.descriptionController.text,
                    priority: controller.priority,
                    timestamp: controller.datePicked.value,
                  );
                  onAdd(task);
                }

                Navigator.of(context).pop();
              },
              child: const Text(
                'Add Task',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
