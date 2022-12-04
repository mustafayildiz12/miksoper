part of '../defective_record_detail.dart';


class ItemInfoRowOne extends StatelessWidget {
  const ItemInfoRowOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Marka",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
            ),
            PageSizedBox.heightXXS(),
            Text(
              "Arzum",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
            ),
          ],
        ),
        PageSizedBox.width(32.w),
        Column(
          children: [
            Text(
              "Kategori",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
            ),
            PageSizedBox.heightXXS(),
            Text(
              "Teknoloji",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}