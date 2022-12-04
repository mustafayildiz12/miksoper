import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/date_constant.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({required this.path, required this.fileName, Key? key})
      : super(key: key);
  final String path;
  final String fileName;
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Stack(
          children: [
            PDFView(
              filePath: widget.path,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              onRender: (pages) {},
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // _controller.complete(pdfViewController);
              },
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
              },
            ),
            Positioned(
              bottom: 5.h,
              left: 5.w,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(MyColors().colorAccentDark)),
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text('BELGEYİ SİL'),
              ),
            ),
            Positioned(
              bottom: 5.h,
              right: 5.w,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('KAPAT'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                bottom: BorderSide(
                    width: 0.4.w,
                    color: const Color.fromARGB(255, 126, 185, 230)),
              )),
              width: double.infinity,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Padding(
                      padding: PagePadding.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.fileName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: MyColors().colorAccentDark),
                            overflow: TextOverflow.ellipsis,
                          ),
                          PageSizedBox.heightS(),
                          Text(
                            TakeTime().formatDate(DateTime.now()),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
                ],
              ),
            )
          ],
        ));
  }
}
