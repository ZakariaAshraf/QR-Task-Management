import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky/controllers/auth_controller.dart';
import 'package:tasky/views/home_page.dart';
import 'package:tasky/views/splash_screen.dart';
import '../views/onboarding.dart';

class AuthWrapper extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while checking the auth state
          return CircularProgressIndicator();
        } else {
          // If the user is logged in, go to the HomePage
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          }
          // If the user is not logged in, go to the SplashScreen
          return SplashScreen();
        }
      },
    );
  }
}