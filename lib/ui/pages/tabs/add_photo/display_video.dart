import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miksoper/core/helpers/mobxs/upload_videos/upload_video.dart';

import 'aspect_ratio_video.dart';

class DisplayVideo extends StatefulWidget {
  const DisplayVideo({Key? key}) : super(key: key);

  @override
  _DisplayVideoState createState() => _DisplayVideoState();
}

class _DisplayVideoState extends State<DisplayVideo> {
  Widget _previewVideo() {
    final uploadVideo = UploadVideo();
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (uploadVideo.controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(uploadVideo.controller),
    );
  }

  Widget _previewImages() {
    final uploadVideo = UploadVideo();
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (uploadVideo.imageFileList != null) {
      return Semantics(
          label: 'image_picker_example_picked_images',
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (context, index) {
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(uploadVideo.imageFileList![index].path)
                    : Image.file(File(uploadVideo.imageFileList![index].path)),
              );
            },
            itemCount: uploadVideo.imageFileList!.length,
          ));
    } else if (uploadVideo.pickImageError != null) {
      return Text(
        'Pick image error: $uploadVideo._pickImageError',
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
    final uploadVideo = UploadVideo();
    if (uploadVideo.isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final uploadVideo = UploadVideo();
    final LostDataResponse response =
        await uploadVideo.picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        uploadVideo.isVideo = true;
        await uploadVideo.playVideo(response.file);
      } else {
        uploadVideo.isVideo = false;
        setState(() {
          uploadVideo.imageFile = response.file;
          uploadVideo.imageFileList = response.files;
        });
      }
    } else {
      uploadVideo.retrieveDataError = response.exception!.code;
    }
  }

  @override
  void deactivate() {
    final uploadVideo = UploadVideo();
    if (uploadVideo.controller != null) {
      uploadVideo.controller!.setVolume(0.0);
      uploadVideo.controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    final uploadVideo = UploadVideo();
    uploadVideo.disposeVideoController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uploadVideo = UploadVideo();
    return Scaffold(
      body: Observer(builder: (_) {
        return Center(
          child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
              ? FutureBuilder<void>(
                  future: retrieveLostData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
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
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                uploadVideo.isVideo = true;
                uploadVideo.onImageButtonPressed(ImageSource.gallery);
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
                uploadVideo.isVideo = true;
                uploadVideo.onImageButtonPressed(ImageSource.camera);
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
    final uploadVideo = UploadVideo();
    if (uploadVideo.retrieveDataError != null) {
      final Text result = Text(uploadVideo.retrieveDataError!);
      uploadVideo.retrieveDataError = null;
      return result;
    }
    return null;
  }
}
