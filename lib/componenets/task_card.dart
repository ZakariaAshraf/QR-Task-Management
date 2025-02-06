import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tasky/controllers/home_controller.dart';
import 'package:tasky/views/product_details.dart';

import 'task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ProductDetails(task,task.timestamp.toString())),
      child: Slidable(
        startActionPane: ActionPane(extentRatio: 0.25,motion: DrawerMotion(), children: [
          SlidableAction(
            flex: 2,
            onPressed: (BuildContext context) {
               controller.deleteTask(task);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(15.0),
          ),
        ]),
        child:  Container(
          width: 375,
          height: 96,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/GROCERY.png"),
              ),
              title: Text(
                task.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(task.description,overflow: TextOverflow.ellipsis,),

            ),
          ),
        ),
      ),

    );
  }
}
