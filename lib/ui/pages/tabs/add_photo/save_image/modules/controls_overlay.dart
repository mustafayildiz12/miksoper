part of '../save_img.dart';

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({required this.uploadVideo, Key? key})
      : super(key: key);
  final UploadVideo uploadVideo;

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

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    /*
    final UploadVideoProvider uploadVideoProvider =
        Provider.of<UploadVideoProvider>(context);
   */
    //  final uploadVideo = UploadVideo();
    return Observer(builder: (_) {
      return Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 7.w,
                child: Icon(
                  widget.uploadVideo.isPlaying 
                      ? Icons.pause_outlined
                      : Icons.play_arrow,
                  color: Colors.white70,
                  size: 26.sp,
                  semanticLabel:
                      widget.uploadVideo.isPlaying ? 'Play' : 'Pause',
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // print(uploadVideo.isPlaying);
              widget.uploadVideo.playOrPause();
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: PopupMenuButton<Duration>(
              color: Colors.white,
              initialValue:
                  widget.uploadVideo.videoPlayerController!.value.captionOffset,
              tooltip: 'Caption Offset',
              onSelected: (delay) =>
                  widget.uploadVideo.setCaptionDuration(delay),
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
                child: Text('${widget.uploadVideo.captionOfset}ms',
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<double>(
              color: Colors.white,
              initialValue:
                  widget.uploadVideo.videoPlayerController!.value.playbackSpeed,
              tooltip: 'Playback speed',
              onSelected: (double speed) {
                widget.uploadVideo.setPlaybackSpeed(speed);
                //  uploadVideo.notify();
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
                  '${widget.uploadVideo.videoSpeed}x',
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
