import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/core/helpers/mobxs/upload_videos/upload_video.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/helpers/mobxs/upload_images/upload_image.dart';
import '../../../../../core/repositories/mix_life_cycle.dart';
import '../../../widgets/fake_bar.dart';

part 'modules/upload_img_row.dart';
part 'modules/upload_video_row.dart';
part 'modules/controls_overlay.dart';

class SaveImg extends StatefulWidget {
  const SaveImg({Key? key}) : super(key: key);

  @override
  _SaveImgState createState() => _SaveImgState();
}

class _SaveImgState extends State<SaveImg> {
  @override
  Widget build(BuildContext context) {
    /*
     final UploadVideoProvider uploadVideoProvider =
        Provider.of<UploadVideoProvider>(context);
    */
    final uploadVideo = UploadVideo();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              print(1.1);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 2,
      ),
      body: SingleChildScrollView(child: Observer(builder: (_) {
        return Column(
          children: [
            const FakeBar(),
            Padding(
              padding: PagePadding.allS(),
              child: Column(
                children: [
                  const _UploadImgRow(),
                  PageSizedBox.heightM(),
                  const Text('İstersen arızanı bir video ile anlat'),
                  PageSizedBox.heightM(),
                  _UploadVideoRow(
                    uploadVideo: uploadVideo,
                  ),
                  PageSizedBox.heightM(),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(90.w, 6.h)),
                      shape: const MaterialStatePropertyAll(StadiumBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(MyColors().grey_90),
                    ),
                    onPressed: () {
                      uploadVideo.video = null;
                      //  uploadVideoProvider.notify();
                      print(2.2);
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostDefective(),
                        ),
                      );
                    */
                    },
                    child: const Text('Görüntüleri Kaydet ve Devam Et'),
                  ),
                  PageSizedBox.heightM(),
                ],
              ),
            )
          ],
        );
      })),
    );
  }
}
