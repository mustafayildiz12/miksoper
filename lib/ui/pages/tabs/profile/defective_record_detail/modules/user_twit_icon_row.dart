part of '../defective_record_detail.dart';

class _UsetTwitIconsRow extends StatelessWidget {
  const _UsetTwitIconsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allS(),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: MyColors().green_300,
              ),
              PageSizedBox.widthS(),
              Text(
                '12 likes',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MyColors().grey_500),
              )
            ],
          ),
          PageSizedBox.widthL(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    const _PostCommentDialog().show(context);
                  },
                  icon: const Icon(
                    Icons.chat,
                    color: Colors.blue,
                  )),
              Text('4 Comments',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: MyColors().grey_500))
            ],
          ),
          const Spacer(),
          Text('3h ago',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: MyColors().grey_600)),
          PageSizedBox.widthXS(),
        ],
      ),
    );
  }
}

class _PostCommentDialog extends StatelessWidget {
  const _PostCommentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      titlePadding: EdgeInsets.zero,
      content: Builder(
        builder: (context) {
          final width = MediaQuery.of(context).size.width / 100;
          CommentProvider commentProvider =
              Provider.of<CommentProvider>(context);
          return SizedBox(
            width: width * 90,
            child: Column(
              children: [
                _CommentPostFakeBar(
                  commentProvider: commentProvider,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        CommentRow(),
                        CommentRow(),
                      ],
                    ),
                  ),
                ),
                //   const Spacer(),
                Padding(
                  padding: PagePadding.horizontalS(),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: commentProvider.commentValue,
                          onChanged: (comment) {
                            commentProvider.commentValue = comment;

                            commentProvider.notify();
                          },
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Ayşe Demir'e cevap veriyorsun",
                              hintStyle: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                      IconButton(
                          onPressed: commentProvider.commentValue != ''
                              ? () {
                                  print(commentProvider.commentValue);
                                }
                              : null,
                          icon: const Icon(
                            Icons.send,
                            //  color: MyColors().colorAccentDark,
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/*

 */

class _CommentPostFakeBar extends StatelessWidget {
  const _CommentPostFakeBar({
    required this.commentProvider,
    Key? key,
  }) : super(key: key);
  final CommentProvider commentProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors().colorAccentDark,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              commentProvider.notify();
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
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          PageSizedBox.widthXS(),
        ],
      ),
    );
  }
}

extension PostCommentDialogExtension on _PostCommentDialog {
  show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => this,
    );
  }
}
