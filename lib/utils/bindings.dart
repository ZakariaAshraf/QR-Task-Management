import 'package:get/get.dart';
import 'package:tasky/controllers/home_controller.dart';

import '../controllers/add_task_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(AddTaskController());
  }

}