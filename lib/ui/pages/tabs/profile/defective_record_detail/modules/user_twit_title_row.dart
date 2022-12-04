part of '../defective_record_detail.dart';

class _UserTwitTitleRow extends StatelessWidget {
  const _UserTwitTitleRow({
    Key? key,
  }) : super(key: key);

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
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}