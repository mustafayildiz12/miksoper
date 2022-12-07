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
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          uploadImage.image == null
              ? Container(
                  height: 25.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_10.jpg'),
                        fit: BoxFit.cover),
                  ),
                )
              : SizedBox(
                  height: 25.h,
                  child: Image.file(
                    File(uploadImage.image!.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
          Container(
            height: 25.h,
            width: 40.w,
            color: MyColors().grey_10,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: 10.h,
                    // width: 20.w,
                    child: Image.asset(
                      'assets/icons/imgup2.png',
                      fit: BoxFit.fitHeight,
                    )),
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
          )
        ],
      );
    });
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

  bool? isMediaAccessOkay;

  File? _video;
  File? _cameraVideo;

  ImagePicker picker = ImagePicker();

  VideoPlayerController? _videoPlayerController;

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    var pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
  }

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
        child: _video != null
            ? _videoPlayerController!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoPlayer(_videoPlayerController!),
                        _ControlsOverlay(
                          controller: _videoPlayerController!,
                        ),
                        VideoProgressIndicator(_videoPlayerController!,
                            colors: const VideoProgressColors(
                                playedColor: Colors.white,
                                bufferedColor: Colors.black),
                            allowScrubbing: true),
                        /*
                        Positioned(
                          left: 10.w,
                          bottom: 10.h,
                          child: IconButton(
                            onPressed: () {
                              _videoPlayerController!.value.isPlaying
                                  ? _videoPlayerController!.pause()
                                  : _videoPlayerController!.play();
                                  setState(() {
                                    
                                  });
                            },
                            icon: Icon(
                              _videoPlayerController!.value.isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )
                       */
                      ],
                    ),
                  )
                : Container()
            : Column(
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
                      _pickVideo();
                    },
                    child: const Text('Video Yükle'),
                  ),
                  PageSizedBox.height(3.h),
                ],
              ));
  }

  @override
  void onResume() {
    _checkVideoPermission();
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.pause_outlined,
                      color: Colors.white70,
                      size: 30.sp,
                      semanticLabel: 'Play',
                    ),
                  ),
                )
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white70,
                      size: 30.sp,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
            setState(() {});
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            color: Colors.white,
            initialValue: widget.controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              widget.controller.setCaptionOffset(delay);
              setState(() {});
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration
                    in _ControlsOverlay._exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text(
                      '${offsetDuration.inMilliseconds}ms',
                      style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                    ),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                  '${widget.controller.value.captionOffset.inMilliseconds}ms',
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            color: Colors.white,
            initialValue: widget.controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              widget.controller.setPlaybackSpeed(speed);
              setState(() {});
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed
                    in _ControlsOverlay._examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text(
                      '${speed}x',
                      style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                    ),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '${widget.controller.value.playbackSpeed}x',
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
