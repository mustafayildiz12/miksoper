import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/ui/pages/auth/login_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  int currentPosition = 0;
  final MyColors _colors = MyColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              PageSizedBox.heightL(),
              Text(
                "Başlarken ...",
                style: TextStyle(
                    color: _colors.colorAccentDark,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
              PageSizedBox.heightM(),
              Text(
                "Bir kaç adımdan bahsetmek istedik !",
                style: TextStyle(
                    color: _colors.bluegrey_400,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (position) {
                    currentPosition = position;
                    setState(() {});
                  },
                  children: [
                    _PageViewItem(
                      pageViewItems: _PageViewItems(
                          "image_1.jpg",
                          "img_wizard_gallery.png",
                          "Sosyal Medyada Paylaş",
                          "Sosyal Medyada sorununu paylaşarak daha hızlı çözüm bulabilirsin",
                          "İleri",
                          controller,
                          currentPosition),
                    ),
                    _PageViewItem(
                      pageViewItems: _PageViewItems(
                          "image_2.jpg",
                          "img_wizard_video.png",
                          "Sosyal Medyada Paylaş",
                          "Sosyal Medyada sorununu paylaşarak daha hızlı çözüm bulabilirsin",
                          'İleri',
                          controller,
                          currentPosition),
                    ),
                    _PageViewItem(
                      pageViewItems: _PageViewItems(
                          'image_3.jpg',
                          'img_wizard_detail.png',
                          'Sosyal Medyada Paylaş',
                          'Sosyal Medyada sorununu paylaşarak daha hızlı çözüm bulabilirsin',
                          'İleri',
                          controller,
                          currentPosition),
                    ),
                    _PageViewItem(
                      pageViewItems: _PageViewItems(
                          'image_4.jpg',
                          'img_wizard_social.png',
                          'Sosyal Medyada Paylaş',
                          'Sosyal Medyada sorununu paylaşarak daha hızlı çözüm bulabilirsin',
                          'Başlayalım !',
                          controller,
                          currentPosition),
                    ),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 4,
                position: currentPosition.toDouble(),
                decorator: DotsDecorator(
                  color: _colors.bluegrey_300,
                  activeColor: _colors.green_500,
                ),
              ),
              PageSizedBox.heightM(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({
    required this.pageViewItems,
    Key? key,
  }) : super(key: key);
  final _PageViewItems pageViewItems;
  @override
  Widget build(BuildContext context) {
    final MyColors colors = MyColors();
    return Column(
      children: [
        PageSizedBox.height(10.h),
        Container(
          width: 80.w,
          height: 52.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/${pageViewItems.bigImagePath}'),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              decoration:
                  BoxDecoration(color: colors.colorAccentDark.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PageSizedBox.heightM(),
                  Text(
                    pageViewItems.imageTitle,
                    style: TextStyle(
                        color: colors.colorPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  PageSizedBox.heightL(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      pageViewItems.imageContent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colors.colorPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  PageSizedBox.height(12.h),
                  SizedBox(
                      height: 20.h,
                      child: Image.asset(
                        'assets/icons/${pageViewItems.smallImagePath}',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (pageViewItems.currentPosition != 3) {
              pageViewItems.controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            }
          },
          child: Container(
            width: 80.w,
            height: 7.h,
            color: colors.colorAccentDark,
            child: Center(
                child: Text(
              pageViewItems.buttonTitle,
              style: TextStyle(
                  color: colors.colorPrimary,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400),
            )),
          ),
        )
      ],
    );
  }
}

class _PageViewItems {
  final String bigImagePath;
  final String smallImagePath;
  final String imageTitle;
  final String imageContent;
  final String buttonTitle;
  final PageController controller;
  final int currentPosition;

  _PageViewItems(
      this.bigImagePath,
      this.smallImagePath,
      this.imageTitle,
      this.imageContent,
      this.buttonTitle,
      this.controller,
      this.currentPosition);
}
