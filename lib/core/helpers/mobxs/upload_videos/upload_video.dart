import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

import '../../../repositories/image_repository.dart';
import '../../../repositories/pick_manager.dart';

part 'upload_video.g.dart';

// ignore: library_private_types_in_public_api
class UploadVideo = _UploadVideo with _$UploadVideo;

abstract class _UploadVideo with Store {
  final ImagePicker picker = ImagePicker();
  final IPickManager pickManager = PickManager();
  final IPermissionHandler permissionHandler = PermissionHandler();
  @observable
  bool? isMediaAccessOkay;
  @observable
  File? video;
  @observable
  bool isPlaying = false;
  @observable
  int captionOfset = 0;
  @observable
  double videoSpeed = 1;
  @observable
  VideoPlayerController? videoPlayerController;

  @action
  Future pickVideo() async {
    var pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    video = File(pickedFile!.path);

    videoPlayerController = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        videoPlayerController!.play();
        isPlaying = true;
      });
  }

  @action
  setCaptionDuration(Duration delay) {
    videoPlayerController!.setCaptionOffset(delay);
    captionOfset = videoPlayerController!.value.captionOffset.inMilliseconds;
  }

  @action
  setPlaybackSpeed(double speed) {
    videoPlayerController!.setPlaybackSpeed(speed);
    videoSpeed = videoPlayerController!.value.playbackSpeed;
  }

  @action
  playOrPause() {
    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
      isPlaying = false;
    } else {
      videoPlayerController!.play();
      isPlaying = true;
    }
  }

  @action
  Future<void> checkVideoPermission() async {
    isMediaAccessOkay = await permissionHandler.checkCamera();
    print('MediaOkey: $isMediaAccessOkay');
  }
}
