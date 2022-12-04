part of '../defective_record_detail.dart';

class _ItemInfoRowTwo extends StatelessWidget {
  const _ItemInfoRowTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Oluşturulma Tarihi",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
          ),
          PageSizedBox.heightXXS(),
          Text(
            "02.01.2022",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}