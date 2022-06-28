
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  // final registerApiControl = Get.find<RegisterOtpController>();
  var password= false.obs;
  var email = false.obs;
  var phone = false.obs;
  var passwordControl = '';
  var emailControl = '';
  var phoneControl = '';

  validatePassword(String value) {
    if (value.length < 8) {
      password.value = true;
    } else {
      password.value = false;
      passwordControl = value;
    }
  }

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      email.value = true;
    } else {
      email.value = false;
      emailControl = value;
    }
  }

  validatePhone(String value) {
    if (value.length != 10) {
      phone.value = true;
    } else {
      phone.value = false;
      phoneControl = value;
    }
  }

  checkRegisterForm() async{
    if (password.value == false &&
        email.value == false &&
        phone.value == false &&
        passwordControl.isNotEmpty &&
        emailControl.isNotEmpty &&
        phoneControl.isNotEmpty) {
      // Get.toNamed('/verification');
      // registerApiControl.getRegisterOtp(
      //     name: nameControl, email: emailControl, phone: phoneControl);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControl.trim(), 
        password: passwordControl.trim(),);
      }on FirebaseAuthException catch (e) {
        print(e);
        Get.snackbar('Warning ', e.toString());
      }
    } else {
      Get.snackbar('Warning!', 'Please complete the form');
    }
  }
}
