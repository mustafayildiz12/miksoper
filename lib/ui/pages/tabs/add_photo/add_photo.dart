import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/core/helpers/mobxs/upload_images/upload_image.dart';
import 'package:miksoper/core/repositories/mix_life_cycle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'save_img.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key});

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage>
    with WidgetsBindingObserver, LifeCycleUse {
  @override
  Widget build(BuildContext context) {
    final uploadImage = UploadImageMobx();
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              uploadImage.image != null
                  ? SizedBox(
                      width: 50.w,
                      height: 30.h,
                      child: Image.file(
                        File(uploadImage.image!.path),
                        fit: BoxFit.cover,
                      ))
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
              GestureDetector(
                onTap: () async {
                  uploadImage.isMediaAccessOkay
                      ? await uploadImage.getImage()
                      : uploadImage.checkCameraPermission();
                },
                child: Container(
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: PagePadding.allL(),
                    child: Image.asset(
                      'assets/icons/cameraphoto2.png',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              PageSizedBox.heightXS(),
              SizedBox(
                width: 54.w,
                child: Text(
                  "Sorununu anlatan bir resim çekmek için yukarıdaki "
                  "butona tıklayın",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          );
        }),
      ),
      floatingActionButton: SpeedDial(
        // childPadding: PagePadding.verticalS(),
        backgroundColor: MyColors().grey_90,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.edit),
            backgroundColor: MyColors().grey_400,
            foregroundColor: Colors.white,
            //  label: 'First',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SaveImg(),
                ),
              );
            },
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.circle_outlined),
            backgroundColor: MyColors().grey_400,
            foregroundColor: Colors.white,
            //  label: 'First',
            onTap: () {},
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.square_outlined),
            backgroundColor: MyColors().grey_400,
            foregroundColor: Colors.white,
            //  label: 'First',
            onTap: () {},
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.redo),
            backgroundColor: MyColors().grey_400,
            foregroundColor: Colors.white,
            //  label: 'First',
            onTap: () {},
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
        ],
        child: const Icon(Icons.crop),
      ),
    );
  }

  @override
  void onResume() {
    final uploadImage = UploadImageMobx();
    uploadImage.checkCameraPermission();
    print('onResuma');
  }
}

class _SecondFabButton extends StatelessWidget {
  const _SecondFabButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2.0,
      onPressed: () {},
      focusColor: Colors.amber,
      focusElevation: 16,
      heroTag: 'second',
      child: const Icon(Icons.circle_outlined),
    );
  }
}

class _ThirdFabButton extends StatelessWidget {
  const _ThirdFabButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2.0,
      onPressed: () {},
      focusColor: Colors.amber,
      focusElevation: 16,
      heroTag: 'third',
      child: const Icon(Icons.square_outlined),
    );
  }
}
