import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:sizer/sizer.dart';

class MyPrimaryIcon extends StatelessWidget {
  const MyPrimaryIcon({required this.path, required this.onPressed, super.key});

  final String path;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:  PagePadding.horizontalS(),
        child: SizedBox(
          width: 6.h,
          height: 6.h,
          child: Image.asset(
            "assets/$path.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
