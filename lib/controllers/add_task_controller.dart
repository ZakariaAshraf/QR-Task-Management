import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddTaskController extends GetxController{
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  var datePicked=DateTime.now().obs;
  var image = Rx<File?>(null);
  String? priority;
  List<String> selectedPriority = [
    "Low",
    "Medium",
    "Hard",
  ].obs;


  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path); // Update the reactive variable
    }
  }
  Future<void> selectDate(BuildContext context)async {
  final pickedDate = (
        await DatePicker.showSimpleDatePicker(
          context,
          firstDate: DateTime(2025),
          lastDate: DateTime(2090),
          dateFormat: "dd-MMMM-yyyy",
          locale: DateTimePickerLocale.en_us,
          looping: true,

        ));
  if (pickedDate != null) {
    datePicked.value = pickedDate;
  }
  }
}