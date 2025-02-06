import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky/models/user_model.dart';

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoggedIn = false.obs;

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        isLoggedIn.value = true;
        await saveUserProfile();
        Get.snackbar('Success', 'Registration successful!');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Registration failed');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        isLoggedIn.value = true;
        Get.snackbar('Success', 'Login successful!');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Login failed');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      isLoggedIn.value = false;
      Get.snackbar('Success', 'Logged out successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Logout failed');
    }
  }

  Future<void> saveUserProfile() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': phoneController.text,
          'name': nameController.text,
          'experience': experienceYearsController.text,
          'address': addressController.text,
          'level': levelController.text,
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now(),
        });
        Get.snackbar('Success', 'Profile saved to Firestore');
      } else {
        Get.snackbar('Error', 'No user is currently logged in');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save profile data: $e');
    }
  }

  // Check if the user is already logged in
  void checkAuthState() {
    _auth.authStateChanges().listen((User? user) {
      isLoggedIn.value = user != null;
    });
  }

  @override
  void onInit() {
    checkAuthState();
    super.onInit();
  }
}
