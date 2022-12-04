import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/page_paddings.dart';
import '../../../../core/constants/page_sized_box.dart';

part 'modules/defective_item_detail.dart';

class AltListPage extends StatefulWidget {
  const AltListPage({super.key});

  @override
  State<AltListPage> createState() => _AltListPageState();
}

class _AltListPageState extends State<AltListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => _DefectiveItemDetail(
                                      index: index,
                                    )));
                      },
                      child: _DefectiveItemCard(index: index));
                })
          ],
        ),
      ),
    );
  }
}

class _DefectiveItemCard extends StatelessWidget {
  const _DefectiveItemCard({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                1.0,
                1.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 20.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/image_${index + 1}.jpg'),
                      fit: BoxFit.fitWidth)),
            ),
            PageSizedBox.heightS(),
            Padding(
              padding: PagePadding.horizontal(2.w),
              child: Text(
                "Çamaşır makinem yıkamanın ortasında uyarı veriyor",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyColors().grey_90,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            PageSizedBox.heightM(),
            Padding(
              padding: PagePadding.horizontalS(),
              child: Row(
                children: [
                  Text(
                    "Genel",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors().grey_40,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "Çarş,25 Ekim 21,11:30",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors().grey_40,
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
            ),
            PageSizedBox.heightS(),
          ],
        ),
      ),
    );
  }
}
