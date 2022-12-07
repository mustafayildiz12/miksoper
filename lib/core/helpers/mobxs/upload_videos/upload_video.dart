import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

part 'upload_video.g.dart';

// ignore: library_private_types_in_public_api
class UploadVideo = _UploadVideo with _$UploadVideo;

abstract class _UploadVideo with Store {
  @observable
  List<XFile>? imageFileList;
  set imageFile(XFile? value) {
    imageFileList = value == null ? null : [value];
  }

  dynamic pickImageError;
  bool isVideo = false;
  VideoPlayerController? controller;
  VideoPlayerController? toBeDisposed;
  String? retrieveDataError;
  ImagePicker picker = ImagePicker();

  @action
  Future<void> playVideo(XFile? file) async {
    if (file != null) {
      await disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      controller = controller;

      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
    }
  }

  @action
  Future<void> onImageButtonPressed(ImageSource source) async {
    if (controller != null) {
      await controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await picker.pickVideo(
        source: source,
      );
      await playVideo(file);
    }
  }

  @action
  Future<void> disposeVideoController() async {
    if (toBeDisposed != null) {
      await toBeDisposed!.dispose();
    }
    toBeDisposed = controller;
    controller = null;
  }

  @action
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await playVideo(response.file);
      } else {
        isVideo = false;

        imageFile = response.file;
        imageFileList = response.files;
      }
    } else {
      retrieveDataError = response.exception!.code;
    }
  }
}
