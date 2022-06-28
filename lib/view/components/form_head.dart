
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class form_head extends StatelessWidget {

  final String title;
  const form_head({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      color: textBlueColor
    ),
    );
  }
}