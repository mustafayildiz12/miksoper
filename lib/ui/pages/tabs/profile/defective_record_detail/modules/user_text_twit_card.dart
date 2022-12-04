part of '../defective_record_detail.dart';

class _UserTextTwitCard extends StatelessWidget {
  const _UserTextTwitCard({
    Key? key,
    required this.lorem,
  }) : super(key: key);

  final String lorem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: PagePadding.allM(),
            child: Column(
              children: [
                const _UserTwitTitleRow(),
                PageSizedBox.heightS(),
                Text(
                  lorem,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: MyColors().grey_600),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const _UsetTwitIconsRow(),
        ],
      ),
    );
  }
}


