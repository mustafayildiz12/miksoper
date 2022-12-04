import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/colors.dart';

class SuccessDilogTitle extends StatelessWidget {
  const SuccessDilogTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors().green_400,
      width: 100.w,
      height: 20.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 12.h,
              child: Image.asset(
                'assets/badges/badge_verified.png',
                fit: BoxFit.fitHeight,
              )),
          Text(
            'İşlem Başarılı !',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}