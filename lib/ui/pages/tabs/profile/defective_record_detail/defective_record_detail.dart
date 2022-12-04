import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/core/helpers/providers/comment_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/comment_widget_tree.dart';

part 'modules/user_info_row.dart';
part 'modules/dot_info_row.dart';
part 'modules/img_map.dart';
part 'modules/item_info_row_one.dart';
part 'modules/defective_title.dart';
part 'modules/video_tile.dart';
part 'modules/defective_detail_card.dart';
part 'modules/item_info_row_two.dart';
part 'modules/user_image_twit_card.dart';
part 'modules/user_text_twit_card.dart';
part 'modules/user_twit_title_row.dart';
part 'modules/user_twit_icon_row.dart';

class DefectiveRecordDetail extends StatefulWidget {
  const DefectiveRecordDetail({Key? key}) : super(key: key);

  @override
  _DefectiveRecordDetailState createState() => _DefectiveRecordDetailState();
}

class _DefectiveRecordDetailState extends State<DefectiveRecordDetail> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    "assets/images/image_1.jpg",
    "assets/images/image_2.jpg",
    "assets/images/image_3.jpg",
    "assets/images/image_4.jpg",
    "assets/images/image_5.jpg"
  ];
  late VideoPlayerController _videoController;

  /*
  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }
   */

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        //  closedCaptionFile: _loadCaptions(),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  final String lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => _ImgMap(
              imgList: imgList,
              item: item,
            ))
        .toList();
    CommentProvider commentProvider = Provider.of<CommentProvider>(context);

    return Scaffold(
      backgroundColor: MyColors().grey_300,
      appBar: AppBar(
        leading: null,
      ),
      body: Padding(
        padding: PagePadding.allS(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: PagePadding.allM(),
                color: Colors.white,
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: 30.h,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: imageSliders,
                    ),
                    _DotIndicatorRow(
                        imgList: imgList,
                        controller: _controller,
                        current: _current),
                    PageSizedBox.heightM(),
                    const _UserInfoRow(),
                    const Divider(
                      thickness: 1,
                    ),
                    const ItemInfoRowOne(),
                    PageSizedBox.heightL(),
                    const _ItemInfoRowTwo(),
                  ],
                ),
              ),
              PageSizedBox.heightM(),
              _VideoTile(
                videoController: _videoController,
                commentProvider: commentProvider,
              ),
              PageSizedBox.heightM(),
              const _DefectiveTitle(),
              PageSizedBox.heightM(),
              _DefectiveDetailCard(lorem: lorem),
              PageSizedBox.heightM(),
              _UserTextTwitCard(lorem: lorem),
              PageSizedBox.heightM(),
              _UserImageTwitCard(lorem: lorem),
              PageSizedBox.heightM(),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
