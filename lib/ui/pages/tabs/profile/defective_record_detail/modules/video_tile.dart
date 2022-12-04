part of '../defective_record_detail.dart';

class _VideoTile extends StatelessWidget {
  const _VideoTile({
    required this.commentProvider,
    Key? key,
    required VideoPlayerController videoController,
  })  : _videoController = videoController,
        super(key: key);

  final VideoPlayerController _videoController;
  final CommentProvider commentProvider;

  @override
  Widget build(BuildContext context) {
    /*
    ValueNotifier<bool> isPlaying =
        ValueNotifier(_videoController.value.isPlaying);
    ValueNotifier<bool> isVideoLoaded =
        ValueNotifier(_videoController.value.isInitialized);
    */

    return Container(
      color: Colors.white,
      child: ExpansionTile(
          backgroundColor: Colors.white,
          title: ListTile(
            leading: Icon(Icons.video_call, color: MyColors().colorAccentDark),
          ),
          children: [
            Center(
              child: _videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(_videoController),
                          Positioned(
                            bottom: 0,
                            top: 0,
                            left: 42.w,
                            child: Container(
                              width: 12.w,
                              height: 12.w,
                              decoration: BoxDecoration(
                                  color: Colors.black12.withOpacity(0.3),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      _videoController.value.isPlaying
                                          ? _videoController.pause()
                                          : _videoController.play();
                                    },
                                    icon: Icon(
                                      _videoController.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          VideoProgressIndicator(_videoController,
                              allowScrubbing: true),
                        ],
                      ),
                    )
                  : Padding(
                      padding: PagePadding.allS(),
                      child: const CircularProgressIndicator(),
                    ),
            ),
            PageSizedBox.heightXXS(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: PagePadding.only(right: 4.w),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStatePropertyAll(PagePadding.horizontalL()),
                    backgroundColor:
                        MaterialStatePropertyAll(MyColors().colorAccentDark),
                  ),
                  onPressed: () {
                    commentProvider.isExpanded = false;
                    commentProvider.notify();

                    print(commentProvider.isExpanded);
                  },
                  child: const Text("KAPAT"),
                ),
              ),
            ),
            PageSizedBox.heightXXS(),
          ]),
    );
  }
}
