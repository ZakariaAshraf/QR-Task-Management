import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tasky/utils/bindings.dart';
import 'package:tasky/views/home_page.dart';
import 'package:tasky/views/onboarding.dart';
import 'package:tasky/views/sign_in.dart';
import 'package:tasky/views/sign_up.dart';
import 'package:tasky/views/splash_screen.dart';

import 'middelware/auth_wrapper.dart';
import 'views/profile_view.dart';

//SharedPreferences? sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //sharedPref=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? "/onBoarding" : "/wrapper",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/onBoarding", page: () => OnboardingScreen()),
        GetPage(name: "/login", page: () => SignIn()),
        GetPage(name: "/register", page: () => SignUp()),
        GetPage(name: "/home", page: () => HomePage(),),
        GetPage(name: "/wrapper", page: () => AuthWrapper(),),
        GetPage(name: "/profile", page: () => ProfileView(),),
      ],
      initialBinding: MyBindings(),
    );
  }
}
