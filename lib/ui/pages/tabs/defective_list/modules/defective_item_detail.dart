part of '../alt_list.dart';

class _DefectiveItemDetail extends StatelessWidget {
  const _DefectiveItemDetail({required this.index});
  final int index;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

 /*
  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs.isEmpty) return;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            await share();
          },
          child: const Icon(Icons.share)),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Column(
                children: [
                   PageSizedBox.heightM(),
                  Padding(
                    padding:  PagePadding.allS(),
                    child: Text(
                      "What is Lorem Ipsum?",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding:  PagePadding.allS(),
                    child: Text(
                        "Lorem Ipsum is simply dummy text of the printing",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Image.asset('assets/images/image_${index + 1}.jpg'),
                  ),
                  Padding(
                    padding:  PagePadding.allS(),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and"
                      "typesetting industry. Lorem Ipsum has been the industry's"
                      "standard dummy text ever since the 1500s, when "
                      "an unknown printer took a galley of type and "
                      " scrambled it to make a type specimen book. It"
                      "has survived not only five centuries, but also the leap into"
                      "electronic typesetting, remaining essentially unchanged."
                      "It was popularised in the 1960s with the release of Letraset "
                      "sheets containing Lorem Ipsum passages, and more recently"
                      "with desktop publishing software like Aldus PageMaker"
                      "including versions of Lorem Ipsum.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                   PageSizedBox.heightM(),
                  Padding(
                    padding:  PagePadding.horizontalS(),
                    child: Row(
                      children: [
                        Text("3556 likes",
                            style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: MyColors().grey_80,
                            ))
                      ],
                    ),
                  ),
                   PageSizedBox.heightM(),
                ],
              ),
            ),
            const _DefectiveItemCard(
              index: 1,
            ),
            const _DefectiveItemCard(
              index: 2,
            ),
             PageSizedBox.heightM(),
          ],
        ),
      ),
    );
  }
}
