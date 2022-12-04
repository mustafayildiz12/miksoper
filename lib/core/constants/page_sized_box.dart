import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PageSizedBox extends SizedBox {
  const PageSizedBox.empty({Key? key}) : super.shrink(key: key);

  const PageSizedBox.height(double height, {Key? key})
      : super(height: height, key: key);
  PageSizedBox.heightXXS({Key? key}) : super(height: 1.w, key: key);
  PageSizedBox.heightXS({Key? key}) : super(height: 2.w, key: key);
  PageSizedBox.heightS({Key? key}) : super(height: 2.5.w, key: key);
  PageSizedBox.heightM({Key? key}) : super(height: 5.w, key: key);
  PageSizedBox.heightL({Key? key}) : super(height: 7.5.w, key: key);

  const PageSizedBox.width(double width, {Key? key}) : super(width: width, key: key);
  PageSizedBox.widthXS({Key? key}) : super(width: 2.w, key: key);
  PageSizedBox.widthS({Key? key}) : super(width: 2.5.w, key: key);
  PageSizedBox.widthM({Key? key}) : super(width: 5.w, key: key);
  PageSizedBox.widthL({Key? key}) : super(width: 7.5.w, key: key);

  const PageSizedBox({Key? key, double? width, double? height})
      : super(width: width, height: height, key: key);

  const PageSizedBox.element({
    Key? key,
    required Widget child,
    double? width,
    double? height,
  }) : super(width: width, height: height, child: child, key: key);
}
