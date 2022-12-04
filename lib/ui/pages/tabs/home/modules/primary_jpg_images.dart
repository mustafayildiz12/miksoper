part of '../home_page.dart';


class _MyPrimaryJpgImage extends StatelessWidget {
  const _MyPrimaryJpgImage({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.only(right: 3.w),
      child: Container(
        height: 15.h,
        width: 33.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage("assets/$path.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 56, 83).withOpacity(0.4)),
            child: Padding(
              padding: PagePadding.only(left: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageSizedBox.height(8.h),
                  Text("Table Cocktails",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors().colorPrimary,
                          fontWeight: FontWeight.w500)),
                  PageSizedBox.height(0.5.h),
                  Text("20 Jul 2015",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: MyColors().colorPrimary,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
