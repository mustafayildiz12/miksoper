import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyPrimaryTextButton extends StatelessWidget {
  const MyPrimaryTextButton(
      {required this.onPressed,
      required this.text,
      this.color = const Color(0XFF78909C),
      super.key});
  final String text;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: 17.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
