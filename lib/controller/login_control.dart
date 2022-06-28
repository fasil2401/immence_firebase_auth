import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginFormControl extends GetxController {
  var emailorphoneControl = '';
  var passwordControl = '';
  var email = false.obs;
  var password = false.obs;

  validateEmailorphone(String value) {
    emailorphoneControl = value;
  }

  validatePassword(String value) {
    passwordControl = value;
  }

  Future signIn() async {
   
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailorphoneControl.trim(),
        password: passwordControl.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar('Warning ', e.toString());
    }
  }
}
