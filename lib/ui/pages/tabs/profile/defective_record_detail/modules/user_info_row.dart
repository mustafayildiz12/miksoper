part of '../defective_record_detail.dart';

class _UserInfoRow extends StatelessWidget {
  const _UserInfoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5.w,
          backgroundImage: const AssetImage("assets/images/image_5.jpg"),
        ),
        PageSizedBox.widthM(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ahmet Genç",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 10.sp),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 10.sp,
                ),
                PageSizedBox.widthS(),
                Text(
                  "İstanbul,Turkey",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(StadiumBorder()),
            padding: MaterialStatePropertyAll(PagePadding.horizontalL()),
            backgroundColor:
                MaterialStatePropertyAll(MyColors().colorAccentDark),
          ),
          onPressed: () {},
          child: const Text("Takip Et"),
        ),
        PageSizedBox.widthM(),
      ],
    );
  }
}