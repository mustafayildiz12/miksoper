import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class MyPrimaryButton extends StatelessWidget {
  const MyPrimaryButton(
      {required this.title, required this.onPressed, super.key});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
            color: MyColors().colorAccentDark,
            borderRadius: BorderRadius.circular(5.w)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: MyColors().colorPrimary,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
