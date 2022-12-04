import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.zero() : super.all(0);
  PagePadding.allXS() : super.all(2.w);
  PagePadding.allS() : super.all(2.5.w);
  PagePadding.allM() : super.all(4.w);
  PagePadding.allL() : super.all(6.w);
  const PagePadding.customAll(double size) : super.all(size);

  const PagePadding.symmetric({double horizontal = 0, double vertical = 0})
      : super.symmetric(horizontal: horizontal, vertical: vertical);

  const PagePadding.symmetricHxVxs()
      : super.symmetric(
          vertical: 6,
          horizontal: 16,
        );
  const PagePadding.vertical(double? size)
      : super.symmetric(vertical: size ?? 0);
  PagePadding.verticalXS() : super.symmetric(vertical: 2.w);
  PagePadding.verticalS() : super.symmetric(vertical: 2.5.w);
  PagePadding.verticalM() : super.symmetric(vertical: 5.w);
  PagePadding.verticalL() : super.symmetric(vertical: 7.5.w);

  const PagePadding.horizontal(double? size)
      : super.symmetric(horizontal: size ?? 0);

  PagePadding.horizontalXS() : super.symmetric(horizontal: 2.w);
  PagePadding.horizontalS() : super.symmetric(horizontal: 2.5.w);
  PagePadding.horizontalM() : super.symmetric(horizontal: 5.w);
  PagePadding.horizontalL() : super.symmetric(horizontal: 7.5.w);

  const PagePadding.only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) : super.only(top: top, right: right, bottom: bottom, left: left);
}
