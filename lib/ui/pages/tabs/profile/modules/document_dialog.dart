part of '../profile.dart';

class _DocumentDialog extends StatelessWidget {
  const _DocumentDialog();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: const Text("Dökümanlarım"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
            ],
          ),
          body: Padding(
            padding: PagePadding.allM(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageSizedBox.heightM(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dökümanlarım',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                          onPressed: () {
                            const _UploadDocumentDialog().show(context);
                          },
                          child: Text(
                            "YENİ BELGE YÜKLE",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors().grey_80),
                          ))
                    ],
                  ),
                  GridView.builder(
                      physics: const ScrollPhysics(parent: ScrollPhysics()),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _GridItemCard(
                          index: index,
                          title: 'Marka $index',
                        );
                      }),
                  PageSizedBox.heightM(),
                ],
              ),
            ),
          )),
    );
  }
}

class _GridItemCard extends StatelessWidget {
  const _GridItemCard({
    required this.title,
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: PagePadding.horizontalXS(),
          child: Container(
            width: 45.w,
            height: 12.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.w),
                    topRight: Radius.circular(2.w)),
                image: DecorationImage(
                    image: AssetImage('assets/images/image_${index + 1}.jpg'),
                    fit: BoxFit.fitWidth)),
          ),
        ),
        Padding(
          padding: PagePadding.horizontalXS(),
          child: Container(
            height: 8.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(2.w),
                  bottomRight: Radius.circular(2.w)),
            ),
            child: ListTile(
              title: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'PDF',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal, color: MyColors().grey_40),
              ),
              trailing: Icon(Icons.more_vert, color: MyColors().grey_40),
            ),
          ),
        ),
      ],
    );
  }
}

/*

 */