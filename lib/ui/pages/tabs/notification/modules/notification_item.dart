part of '../notifications.dart';

class _NotificationItemTile extends StatelessWidget {
  const _NotificationItemTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Arızana benzer bir durum oluştu",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: MyColors().grey_80,
                ),
          ),
          leading: CircleAvatar(
            radius: 4.h,
            backgroundImage: AssetImage('assets/images/image_${index + 1}.jpg'),
          ),
          subtitle: Padding(
            padding: PagePadding.only(top: 1.w),
            child: Text(
              "Lorem Ipsum has been the industry's standard dummy text"
              "ever since the 1500s, when an unknown printer",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MyColors().grey_40,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
        Padding(
          padding: PagePadding.only(left: 20.w),
          child: const Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
