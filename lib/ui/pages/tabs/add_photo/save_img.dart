import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/helpers/mobxs/upload_images/upload_image.dart';
import '../../../../core/repositories/image_repository.dart';
import '../../../../core/repositories/mix_life_cycle.dart';
import '../../../../core/repositories/pick_manager.dart';
import '../../widgets/fake_bar.dart';
import 'aspect_ratio_video.dart';
import 'display_video.dart';
import 'post_defective.dart';

class SaveImg extends StatefulWidget {
  const SaveImg({Key? key}) : super(key: key);

  @override
  _SaveImgState createState() => _SaveImgState();
}

class _SaveImgState extends State<SaveImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FakeBar(),
            Padding(
              padding: PagePadding.allS(),
              child: Column(
                children: [
                  const _UploadImgRow(),
                  PageSizedBox.heightM(),
                  const Text('İstersen arızanı bir video ile anlat'),
                  PageSizedBox.heightM(),
                  const _UploadVideoRow(),
                  PageSizedBox.heightM(),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(90.w, 6.h)),
                      shape: const MaterialStatePropertyAll(StadiumBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(MyColors().grey_90),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostDefective(),
                        ),
                      );
                    },
                    child: const Text('Görüntüleri Kaydet ve Devam Et'),
                  ),
                  PageSizedBox.heightM(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UploadImgRow extends StatefulWidget {
  const _UploadImgRow({
    Key? key,
  }) : super(key: key);

  @override
  State<_UploadImgRow> createState() => _UploadImgRowState();
}

class _UploadImgRowState extends State<_UploadImgRow>
    with WidgetsBindingObserver, LifeCycleUse {
  @override
  Widget build(BuildContext context) {
    final uploadImage = UploadImageMobx();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 25.h,
          width: 40.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/image_10.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Observer(builder: (_) {
          return Container(
            height: 25.h,
            width: 40.w,
            color: MyColors().grey_10,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: 10.h,
                  // width: 20.w,
                  child: uploadImage.image == null
                      ? Image.asset(
                          'assets/icons/imgup2.png',
                          fit: BoxFit.fitHeight,
                        )
                      : Image.file(
                          File(uploadImage.image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
                //  PageSizedBox.height(1.h),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(20.w, 5.h)),
                    shape: const MaterialStatePropertyAll(StadiumBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(MyColors().colorAccentDark),
                  ),
                  onPressed: () async {
                    uploadImage.getImage();
                  },
                  child: const Text('Fotoğraf Yükle'),
                ),
                PageSizedBox.height(2.h),
              ],
            ),
          );
        })
      ],
    );
  }

  @override
  void onResume() {
    final uploadImage = UploadImageMobx();
    uploadImage.checkCameraPermission();
    print('onResuma');
  }
}

class _UploadVideoRow extends StatefulWidget {
  const _UploadVideoRow({
    Key? key,
  }) : super(key: key);

  @override
  State<_UploadVideoRow> createState() => _UploadVideoRowState();
}

class _UploadVideoRowState extends State<_UploadVideoRow>
    with WidgetsBindingObserver, LifeCycleUse {
  final IPickManager pickManager = PickManager();
  final IPermissionHandler permissionHandler = PermissionHandler();
  XFile? image;
  bool? isMediaAccessOkay;
  VideoPlayerController? _controller;

  Future<void> _checkVideoPermission() async {
    isMediaAccessOkay = await permissionHandler.checkCamera();
    print('MediaOkey: $isMediaAccessOkay');
    //  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 100.w,
      color: MyColors().grey_10,
      child: _controller == null
          ? Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: 18.h,
                    // width: 20.w,
                    child: Image.asset(
                      'assets/icons/videoupload.png',
                      fit: BoxFit.fitHeight,
                    )),
                //   PageSizedBox.height(3.h),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(90.w, 5.h)),
                    shape: const MaterialStatePropertyAll(StadiumBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(MyColors().colorAccentDark),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DisplayVideo(),
                      ),
                    );
                  },
                  child: const Text('Video Yükle'),
                ),
                PageSizedBox.height(3.h),
              ],
            )
          : AspectRatioVideo(_controller),
    );
  }

  @override
  void onResume() {
    _checkVideoPermission();
  }
}
