/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

class DisplayVideo extends StatefulWidget {
  const DisplayVideo({Key? key}) : super(key: key);

  @override
  _DisplayVideoState createState() => _DisplayVideoState();
}

class _DisplayVideoState extends State<DisplayVideo> {
  File? _video;
  File? _cameraVideo;

  ImagePicker picker = ImagePicker();

  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? _cameraVideoPlayerController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image / Video Picker"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _video != null
                    ? _videoPlayerController!.value.isInitialized
                        ? Container(
                            padding: const EdgeInsets.all(12),
                            child: AspectRatio(
                              aspectRatio:
                                  _videoPlayerController!.value.aspectRatio,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  VideoPlayer(_videoPlayerController!),
                                  _ControlsOverlay(
                                    controller: _videoPlayerController!,
                                  ),
                                  /*
                                Positioned(
                                  left: 10.w,
                                  bottom: 10.h,
                                  child: IconButton(
                                    onPressed: () {
                                      _videoPlayerController!.value.isPlaying
                                          ? _videoPlayerController!.pause()
                                          : _videoPlayerController!.play();
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
                            ),
                          )
                        : Container(
                            width: 25.w,
                            height: 15.h,
                            color: Colors.blue,
                          )
                    : ElevatedButton(
                        onPressed: () {
                          _pickVideo();
                        },
                        child: const Text("Pick Video From Gallery"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



 */