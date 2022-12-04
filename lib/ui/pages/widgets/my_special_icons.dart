import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/page_paddings.dart';

class MySpecialIcon extends StatelessWidget {
  const MySpecialIcon({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  PagePadding.horizontalS(),
      child: CircleAvatar(
        radius: 3.h,
        backgroundColor: Colors.black,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500, color: MyColors().colorPrimary),
        ),
      ),
    );
  }
}
