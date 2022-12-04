part of '../profile.dart';

class _ProfileButtons extends StatelessWidget {
  const _ProfileButtons({
    required this.onTap,
    required this.iconData,
    required this.title,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 25.w,
        child: Column(
          children: [
            Container(
              width: 8.h,
              height: 8.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors().colorPrimary),
              child: Center(
                child: Icon(
                  iconData,
                  color: MyColors().colorAccentDark,
                ),
              ),
            ),
             PageSizedBox.heightXS(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
