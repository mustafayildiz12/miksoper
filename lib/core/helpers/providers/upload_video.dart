import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../repositories/image_repository.dart';
import '../../repositories/pick_manager.dart';

class UploadVideoProvider extends ChangeNotifier {
  bool? isMediaAccessOkay;
  bool isPlaying = false;

  File? video;
  final ImagePicker picker = ImagePicker();
  final IPickManager pickManager = PickManager();
  final IPermissionHandler permissionHandler = PermissionHandler();
  File? cameraVideo;

  VideoPlayerController? videoPlayerController;

  pickVideo() async {
    var pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    video = File(pickedFile!.path);

    videoPlayerController = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        videoPlayerController!.play();
        isPlaying = true;
        notify();
      });
    notify();
  }

  playOrPause() {
    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
      isPlaying = false;
      notify();
    } else {
      videoPlayerController!.play();
      isPlaying = true;
      notify();
    }
  }

  Future<void> checkVideoPermission() async {
    isMediaAccessOkay = await permissionHandler.checkCamera();
    print('MediaOkey: $isMediaAccessOkay');
    notify();
  }

  notify() {
    notifyListeners();
  }
}
