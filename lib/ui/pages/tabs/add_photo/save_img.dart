import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

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
  final IPickManager pickManager = PickManager();
  final IPermissionHandler permissionHandler = PermissionHandler();
  XFile? image;
  bool? isMediaAccessOkay;

  Future<void> _checkCameraPermission() async {
    isMediaAccessOkay = await permissionHandler.checkCamera();
    print('MediaOkey: $isMediaAccessOkay');
    //  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                child: image == null
                    ? Image.asset(
                        'assets/icons/imgup2.png',
                        fit: BoxFit.fitHeight,
                      )
                    : Image.file(
                        File(image!.path),
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
                  final newImage = await pickManager.fetchCamereImage();
                  setState(() {
                    image = newImage!.file;
                  });
                },
                child: const Text('Fotoğraf Yükle'),
              ),
              PageSizedBox.height(2.h),
            ],
          ),
        )
      ],
    );
  }

  @override
  void onResume() {
    _checkCameraPermission();
    print('onResuma');
  }
}

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
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
                            builder: (context) => const _DisplayVideo()));
                    /*
                    final newVideo = await pickManager.fetchCameraVideo();
                    setState(() {
                      _controller = VideoPlayerController.file(
                          File(newVideo!.file!.path));
                    });
                    */
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

class _DisplayVideo extends StatefulWidget {
  const _DisplayVideo({Key? key}) : super(key: key);

  @override
  __DisplayVideoState createState() => __DisplayVideoState();
}

class __DisplayVideoState extends State<_DisplayVideo> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;

      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
        source: source,
      );
      await _playVideo(file);
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          label: 'image_picker_example_picked_images',
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (context, index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(File(_imageFileList![index].path)),
              );
            },
            itemCount: _imageFileList!.length,
          ));
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
          _imageFileList = response.files;
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _handlePreview();
                    default:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : _handlePreview(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
              heroTag: 'video0',
              tooltip: 'Pick Video from gallery',
              child: const Icon(Icons.video_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'video1',
              tooltip: 'Take a Video',
              child: const Icon(Icons.videocam),
            ),
          ),
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}
