import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyPrimaryImage extends StatelessWidget {
  const MyPrimaryImage({required this.path, this.onPressed, super.key});

  final String path;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 10.h,
        child: Image.asset(
          "assets/$path.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
