
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/login_control.dart';
import '../../controller/register_controler.dart';
import '../constants/colors.dart';


class LoginButton extends StatelessWidget {
  final String title;
  final String callback;
  final String password;
  final String phone;
  final String email;

  LoginButton(
      {Key? key,
      required this.title,
      required this.callback,
      this.email = '',
      this.password = '',
      this.phone = ''})
      : super(key: key);

  // final registerApiControl = Get.put(RegisterOtpController());
  final loginControl = Get.put(LoginFormControl());
  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: textBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () {
          if(callback== 'login'){
            loginControl.signIn();
          }
         else if(callback== 'register'){
            registerController.checkRegisterForm();
          }
        },
        child: Text(
          title,
          style: TextStyle(
            color: textFieldColor,
            fontSize: 16.sp,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
