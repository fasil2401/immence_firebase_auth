import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class subText extends StatelessWidget {
  subText({Key? key, required this.text, this.color, this.fontWeight})
      : super(key: key);

  final String text;
  Color? color ;
  FontWeight? fontWeight = FontWeight.w400;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}