import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(

        centerBackground: true,
        controllerColor: Colors.black,
        finishButtonText: "Let's Start ->",
        onFinish: (){
          Get.offNamed("/login");
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Color(0xff5F33E1),
        ),
        totalPage: 1,
        headerBackgroundColor: Colors.white,
        background: [
         Image.asset("assets/images/ART.png",width: 350,height: 350,),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 360,
                ),
                Text(
                  '''Task Management &
 To-Do List''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '''This productive tool is designed to help you better manage your task project-wise conveniently!''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
