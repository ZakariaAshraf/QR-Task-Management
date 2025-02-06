// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:tasky/controllers/auth_controller.dart';
//
// import '../main.dart';
//
// class AuthMiddleware extends GetMiddleware{
//   @override
//   RouteSettings? redirect(String? route) {
//     // TODO: implement redirect
//     final authService = Get.find<AuthController>();
//     return authService.isLoggedIn.value ==true ?RouteSettings(name: '/home') :RouteSettings(name: '/login');
//   }
//
// }