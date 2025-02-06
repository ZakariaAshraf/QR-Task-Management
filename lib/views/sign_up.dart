import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/auth_controller.dart';
import '../models/user_model.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images/ART.png"),
                width: 250,
                height: 250,
              ),
            ),
            TextFormField(
              controller: authController.nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IntlPhoneField(
              controller: authController.phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              initialCountryCode: 'EG',
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: authController.experienceYearsController,
              decoration: InputDecoration(
                hintText: "Years of experience",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: authController.addressController,
              decoration: InputDecoration(
                hintText: "Address...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: authController.levelController,
              decoration: InputDecoration(
                hintText: "level",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: authController.passwordController,
              decoration: InputDecoration(
                label: const Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await authController.register(
                      authController.phoneController.text, authController.passwordController.text);
                  if (authController.isLoggedIn == true) {
                    Get.offAllNamed("/home");
                  }
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff5F33E1)),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Already have any account? ",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Color(0xff5F33E1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
