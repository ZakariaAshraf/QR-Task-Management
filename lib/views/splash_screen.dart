import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/views/onboarding.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), (){
      Get.offNamed("/onBoarding");
    });
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            "assets/images/SPLASH.png"),
      ),
    );
  }
}