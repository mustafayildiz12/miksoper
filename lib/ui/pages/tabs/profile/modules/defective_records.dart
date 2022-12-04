part of '../profile.dart';

class _DefectiveRecordDocumentDialog extends StatelessWidget {
  const _DefectiveRecordDocumentDialog();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Arıza Kayıtlarım"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
        body: Padding(
          padding: PagePadding.allM(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageSizedBox.heightS(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Arıza Kayıtlarım',
                      style: TextStyle(
                          color: Theme.of(context).shadowColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600)),
                ),
                PageSizedBox.heightS(),
                //  _DefectiveItemCard(),

                ListView.builder(
                  itemCount: 4,
                  physics: const ScrollPhysics(parent: ScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DefectiveRecordDetail()));
                        },
                        child: const _DefectiveItemCard());
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

class _DefectiveItemCard extends StatelessWidget {
  const _DefectiveItemCard({
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
                      image: AssetImage('assets/images/image_5.jpg'),
                      fit: BoxFit.fitWidth)),
            ),
            PageSizedBox.heightS(),
            Padding(
              padding: PagePadding.horizontal(2.w),
              child: Text("Çamaşır makinem yıkamanın ortasında uyarı veriyor",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500)),
            ),
            PageSizedBox.heightM(),
            Padding(
              padding: PagePadding.horizontalS(),
              child: Row(
                children: [
                  Text("Genel",
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                  const Spacer(),
                  Text("Çarş,25 Ekim 21,11:30",
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400))
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
