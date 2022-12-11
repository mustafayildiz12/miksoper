part of '../save_img.dart';
class _UploadImgRow extends StatefulWidget {
  const _UploadImgRow({
    Key? key,
  }) : super(key: key);

  @override
  State<_UploadImgRow> createState() => _UploadImgRowState();
}

class _UploadImgRowState extends State<_UploadImgRow>
    with WidgetsBindingObserver, LifeCycleUse {
  @override
  Widget build(BuildContext context) {
    final uploadImage = UploadImageMobx();
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          uploadImage.image == null
              ? Container(
                  height: 25.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_10.jpg'),
                        fit: BoxFit.cover),
                  ),
                )
              : SizedBox(
                  height: 25.h,
                  child: Image.file(
                    File(uploadImage.image!.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
          Container(
            height: 25.h,
            width: 40.w,
            color: MyColors().grey_10,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: 10.h,
                    // width: 20.w,
                    child: Image.asset(
                      'assets/icons/imgup2.png',
                      fit: BoxFit.fitHeight,
                    )),
                //  PageSizedBox.height(1.h),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(20.w, 5.h)),
                    shape: const MaterialStatePropertyAll(StadiumBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(MyColors().colorAccentDark),
                  ),
                  onPressed: () async {
                    uploadImage.getImage();
                  },
                  child: const Text('Fotoğraf Yükle'),
                ),
                PageSizedBox.height(2.h),
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  void onResume() {
    final uploadImage = UploadImageMobx();
    uploadImage.checkCameraPermission();
    print('onResuma');
  }
}