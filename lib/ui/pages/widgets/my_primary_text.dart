import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MyPrimaryText extends StatelessWidget {
  const MyPrimaryText({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Theme.of(context).focusColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold),
    );
  }
}

class MyPrimaryTextThin extends StatelessWidget {
  const MyPrimaryTextThin({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: MyColors().bluegrey_300,
          fontSize: 17.sp,
          fontWeight: FontWeight.w400),
    );
  }
}
