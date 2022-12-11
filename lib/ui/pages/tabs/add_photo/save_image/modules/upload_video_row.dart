part of '../save_img.dart';

class _UploadVideoRow extends StatefulWidget {
  const _UploadVideoRow({
    required this.uploadVideo,
    Key? key,
  }) : super(key: key);

  final UploadVideo uploadVideo;

  @override
  State<_UploadVideoRow> createState() => _UploadVideoRowState();
}

class _UploadVideoRowState extends State<_UploadVideoRow>
    with WidgetsBindingObserver, LifeCycleUse {
  @override
  Widget build(BuildContext context) {
    /*
    final UploadVideoProvider uploadVideoProvider =
        Provider.of<UploadVideoProvider>(context);
   */
    // final uploadVideo = UploadVideo();
    return Observer(builder: (_) {
      return Container(
          height: 35.h,
          width: 100.w,
          color: MyColors().grey_10,
          child: widget.uploadVideo.video != null
              ? AspectRatio(
                  aspectRatio: widget
                      .uploadVideo.videoPlayerController!.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(widget.uploadVideo.videoPlayerController!),
                      _ControlsOverlay(
                        uploadVideo: widget.uploadVideo,
                      ),
                      VideoProgressIndicator(
                          widget.uploadVideo.videoPlayerController!,
                          colors: const VideoProgressColors(
                              playedColor: Colors.white,
                              bufferedColor: Colors.black),
                          allowScrubbing: true),
                    ],
                  ),
                )
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
                        backgroundColor: MaterialStatePropertyAll(
                            MyColors().colorAccentDark),
                      ),
                      onPressed: () async {
                        widget.uploadVideo.pickVideo();
                      },
                      child: const Text('Video Yükle'),
                    ),
                    PageSizedBox.height(3.h),
                  ],
                ));
    });
  }

  @override
  void onResume() {
    /*
    final UploadVideoProvider uploadVideoProvider =
        Provider.of<UploadVideoProvider>(context, listen: false);
    */

    widget.uploadVideo.checkVideoPermission();
  }
}
