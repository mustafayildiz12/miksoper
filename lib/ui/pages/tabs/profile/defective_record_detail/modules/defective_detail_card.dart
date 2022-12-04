part of '../defective_record_detail.dart';

class _DefectiveDetailCard extends StatelessWidget {
  const _DefectiveDetailCard({
    Key? key,
    required this.lorem,
  }) : super(key: key);

  final String lorem;

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
            "Arıza Detayı",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: MyColors().grey_90,
                ),
          ),
          PageSizedBox.heightXS(),
          Text(
            lorem,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: MyColors().grey_700),
          )
        ],
      ),
    );
  }
}