import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:immence_try/view/components/welcome_text.dart';
import 'package:immence_try/view/constants/colors.dart';
import 'package:immence_try/view/constants/heights.dart';
import 'package:immence_try/view/constants/paddings.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

final user= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonHeight5,
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 50,
                color: textBlueColor,
              ),
            ),
            commonHeight1,
            WelcomeText(
              title: 'John Doe',
              color: textBlueColor,
            ),
            commonHeight4,
            HomeRow(
              title: 'Email',
              subtitle: user!.email.toString(),
            ),
            commonHeight1,
            Divider(),
            commonHeight1,
            HomeRow(
              title: 'Phone No.',
              subtitle: '+91 8590385573',
            ),
            commonHeight1,
            Divider(),
            commonHeight1,
            Padding(
              padding: commonHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: commonBlack),
                  ),
                  InkWell(
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                    },
                    child: Icon(
                      Icons.logout,
                      color: textBlueColor,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Version 1.0.0')
                    ),
                 ),
               ),
          ],
        ),
      )),
    );
  }
}

class HomeRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const HomeRow({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: commonHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: commonBlack),
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: textBlueColor),
          )
        ],
      ),
    );
  }
}
