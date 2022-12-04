part of '../defective_record_detail.dart';

class _DefectiveTitle extends StatelessWidget {
  const _DefectiveTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: PagePadding.allS(),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Arıza için girilen başlık",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: MyColors().grey_90,
                ),
          ),
          PageSizedBox.heightXS(),
          Row(
            children: [
              Icon(
                Icons.share,
                color: MyColors().colorAccentDark,
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: MyColors().colorAccentDark,
                    ),
                  ),
                  Text("381,380",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: MyColors().grey_600)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      const _PostDialog().show(context);
                    },
                    icon: const Icon(Icons.comment_bank_rounded,
                        color: Colors.black),
                  ),
                  Text("56",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: MyColors().grey_600)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostDialog extends StatefulWidget {
  const _PostDialog({Key? key}) : super(key: key);

  @override
  State<_PostDialog> createState() => _PostDialogState();
}

class _PostDialogState extends State<_PostDialog> {
  @override
  Widget build(BuildContext context) {
    CommentProvider commentProvider = Provider.of<CommentProvider>(context);
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        titlePadding: EdgeInsets.zero,
        content: StatefulBuilder(builder: (context, setState) {
          final width = MediaQuery.of(context).size.width / 100;
          return SizedBox(
            width: width * 90,
            //  height: 45.h,
            child: Column(
              children: [
                const _FakeAppBar(),
                Padding(
                  padding: PagePadding.allS(),
                  child: _UserPostRow(
                    value: commentProvider.postValue,
                  ),
                ),
                Padding(
                  padding: PagePadding.allS(),
                  child: TextFormField(
                    onChanged: (e) {
                      commentProvider.postValue = e;
                      commentProvider.notify();
                    },
                    maxLines: null,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type Something',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                fontSize: 10.sp, fontWeight: FontWeight.w500)),
                  ),
                ),
                const Spacer(),
                Container(
                  color: MyColors().grey_200,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          color: MyColors().grey_600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.link,
                          color: MyColors().grey_600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.article,
                          color: MyColors().grey_600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: MyColors().grey_600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

class _UserPostRow extends StatelessWidget {
  const _UserPostRow({
    required this.value,
    Key? key,
  }) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5.w,
          backgroundImage: const AssetImage('assets/images/image_2.jpg'),
        ),
        PageSizedBox.widthM(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emma Richmand',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
            ),
            PageSizedBox.heightXXS(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'in ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 9.sp, fontWeight: FontWeight.w400)),
                  TextSpan(
                    text: 'Hwy,Cartage',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: value == ''
              ? null
              : () {
                  print(value);
                },
          child: const Text('POST'),
        ),
        PageSizedBox.widthS(),
      ],
    );
  }
}

class _FakeAppBar extends StatelessWidget {
  const _FakeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: MyColors().colorAccentDark,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          Text(
            'Yorum  Yap',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          )
        ],
      ),
    );
  }
}

extension PostDialogExtension on _PostDialog {
  show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }
}
