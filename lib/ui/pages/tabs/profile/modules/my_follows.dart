part of '../profile.dart';

class _MyFollowsDialog extends StatelessWidget {
  const _MyFollowsDialog();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Takip Edilenler"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear)),
        ),
        body: Padding(
          padding:  PagePadding.allM(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 PageSizedBox.heightS(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Takip Edilenler',
                      style: TextStyle(
                          color: Theme.of(context).shadowColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600)),
                ),
                 PageSizedBox.heightS(),
                //  _DefectiveItemCard(),

                ListView.builder(
                  itemCount: 4,
                  physics: const ScrollPhysics(parent: ScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const _FollowsItemCard();
                  },
                ),

                 PageSizedBox.heightL(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FollowsItemCard extends StatelessWidget {
  const _FollowsItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                1.0,
                1.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 20.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/image_6.jpg'),
                      fit: BoxFit.fitWidth)),
            ),
             PageSizedBox.heightS(),
            Padding(
              padding:  PagePadding.allS(),
              child: Row(
                children: [
                  Padding(
                    padding:  PagePadding.horizontalXS(),
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding:  PagePadding.horizontalXS(),
                    child: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding:  PagePadding.horizontalXS(),
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "12 Yorum",
                    style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding:  PagePadding.horizontalXS(),
                    child: Icon(
                      Icons.mode_comment_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
             PageSizedBox.heightS(),
          ],
        ),
      ),
    );
  }
}
