import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';

class MyPrimaryFormField extends StatelessWidget {
  const MyPrimaryFormField(
      {required this.onChanged,
      required this.label,
      this.obscureText = false,
      super.key});

  final void Function(String)? onChanged;
  final String label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: MyColors().bluegrey_800)),
    );
  }
}
