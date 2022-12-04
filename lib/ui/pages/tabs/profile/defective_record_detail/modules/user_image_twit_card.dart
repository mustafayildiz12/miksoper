part of '../defective_record_detail.dart';

class _UserImageTwitCard extends StatelessWidget {
  const _UserImageTwitCard({
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
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyColors().grey_600),
                ),
                PageSizedBox.heightS(),
              ],
            ),
          ),
          SizedBox(
            child: Image.asset('assets/images/image_6.jpg'),
          ),
           _UsetTwitIconsRow(),
        ],
      ),
    );
  }
}