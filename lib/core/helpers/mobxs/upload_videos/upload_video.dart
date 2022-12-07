import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

part 'upload_video.g.dart';

// ignore: library_private_types_in_public_api
class UploadVideo = _UploadVideo with _$UploadVideo;

abstract class _UploadVideo with Store {
  // IPickManager pickManager = PickManager();
  // IPermissionHandler permissionHandler = PermissionHandler();
  final ImagePicker picker = ImagePicker();

  @observable
  VideoPlayerController? controller;

  File? video;

  @action
  pickVideo() async {
    var pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    video = File(pickedFile!.path);
    controller = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        controller!.play();
      });
  }

  @action
  stopVideo() async {
    controller!.pause();
  }

  /*
  @action
  Future<void> checkPermission() async {
    isMediaAccessOkay = await permissionHandler.checkMedia();
    print('MediaOkey: $isMediaAccessOkay');
  }
   */

  /*
  @action
  pickVideoFromCamera() async {
    var pickedFile = await pickManager.fetchCameraVideo();

    cameraVideo = File(pickedFile!.file!.path);

    cameraVideoPlayerController = VideoPlayerController.file(cameraVideo!)
      ..initialize().then((_) {
        cameraVideoPlayerController!.play();
      });
  }
  */
}
