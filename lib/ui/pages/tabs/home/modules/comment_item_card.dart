part of '../home_page.dart';
class _CommentsItemCard extends StatelessWidget {
  const _CommentsItemCard({required this.width, required this.path});

  final String path;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  PagePadding.horizontalM(),
              child: Row(
                children: [
                  Text('City Building',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.more_vert)
                ],
              ),
            ),
            PageSizedBox.height(2.h),
            Padding(
              padding:  PagePadding.horizontalM(),
              child: Container(
                height: 20.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage("assets/$path.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            PageSizedBox.height(1.h),
            Padding(
              padding:  PagePadding.horizontalM(),
              child: Text('29 August 2014',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            PageSizedBox.height(1.h),
          ],
        ),
      ),
    );
  }
}
