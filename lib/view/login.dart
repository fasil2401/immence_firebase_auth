
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:immence_try/view/components/sub_text.dart';
import 'package:sizer/sizer.dart';
import '../controller/login_control.dart';
import '../controller/password_controller.dart';
import 'components/form_head.dart';
import 'components/login_button.dart';
import 'components/welcome_text.dart';
import 'constants/colors.dart';
import 'constants/heights.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

final passwordController = Get.put(PasswordController());
final loginControl = Get.put(LoginFormControl());
// final loginCOntroller = Get.put(LoginController());
// TextEditingController _emailorphoneController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            height: 100.h,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                const WelcomeText(
                  title: 'Hi, Welcome back!',
                ),
               
                
                commonHeight5,
                form_head(title: 'Email Address',),
                commonHeight1,
                CupertinoTextField(
                  // controller: _emailorphoneController,
                  onChanged: (value){
                    loginControl.validateEmailorphone(value);
                  },
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey. withOpacity(0.7),
                      width: 0.2.w,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                  placeholder: 'Enter Your email',
                  placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                      
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                 
                ),
                commonHeight2,
                form_head(title: 'Password',),
                commonHeight1,
                Obx(
                  ()=> CupertinoTextField(
                    // controller: _passwordController,
                    onChanged: (value){
                      loginControl.validatePassword(value);
                    },
                      decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey. withOpacity(0.7),
                      width: 0.2.w,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter Your Password',
                    obscureText: passwordController.status.value,
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.placeholderText,
                        
                        fontWeight: FontWeight.w200,
                        fontSize: 14.sp),
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    
                    suffix: InkWell(
                      onTap: (){
                        passwordController.check();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: passwordController.status.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                commonHeight2,
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        subText(text: 'Remember me'),
                      ],
                    ),
                commonHeight2,
                LoginButton(
                  title: 'Log in',
                  callback: 'login',
                ),
                commonHeight2,
               
                
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 70.w,
                        child: EasyRichText(
                          'Dont have an account ? SignUp',
                          textAlign: TextAlign.center,
                          defaultStyle: TextStyle(
                              
                              color: Colors.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w100),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: 'SignUp',
                              style:const TextStyle(
                                  color: textBlueColor, fontWeight: FontWeight.w400),
                              recognizer: TapGestureRecognizer()..onTap =(){Get.toNamed('/register');}
                            ),
                          ],
                        ),
                      ),
                    ),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

