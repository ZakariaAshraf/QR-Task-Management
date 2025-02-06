import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/auth_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: Image(image: AssetImage("assets/images/ART.png"),width: 400,height: 400,),
            ),
            IntlPhoneField(
              disableAutoFillHints: false,
              disableLengthCheck: false,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline_rounded),
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
            //sign in button
            Center(
              child: GestureDetector(
                onTap: () async {
                  await authController.login(phoneController.text, passwordController.text);
                  if (authController.isLoggedIn==true) {
                    Get.offNamed("/home");
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
                      'Login',
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
                const Text("Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/register");
                  },
                  child: const Text(
                    "Sign Up here",
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
