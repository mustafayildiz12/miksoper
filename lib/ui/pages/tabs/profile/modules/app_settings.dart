part of '../profile.dart';

class _AppSettings extends StatelessWidget {
  const _AppSettings();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ayarlar"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
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
                  child: Text('Ayarlar',
                      style: TextStyle(
                          color: Theme.of(context).shadowColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600)),
                ),
                PageSizedBox.heightS(),
                ListTile(
                  title: Text(
                    "Dil Seç",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Türkçe,TR",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyColors().colorAccentDark),
                    ),
                  ),
                ),
                PageSizedBox.heightXS(),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text(
                    "Etkileşimler",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Switch(
                    value: false,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (v) {},
                  ),
                  subtitle: Padding(
                    padding: PagePadding.only(top: 1.w),
                    child: Text(
                      "typesetting industry. Lorem Ipsum has been the "
                      "industry's standard dummy",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text(
                    "Yorum Bildirimleri",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Switch(
                    value: false,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (v) {},
                  ),
                  subtitle: Padding(
                    padding: PagePadding.only(top: 1.w),
                    child: Text(
                      " industry. Lorem Ipsum has been the industry's"
                      "standard dummy",
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                PageSizedBox.heightXS(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: PagePadding.horizontalM(),
                    child: Text(
                      'Genel Bildirimler',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                PageSizedBox.heightM(),
                Row(
                  children: [
                    const Text("Arıza Kayıtları"),
                    const Spacer(),
                    Switch(
                      value: true,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveThumbColor: Colors.black,
                      onChanged: (v) {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Takip Ettiklerim"),
                    const Spacer(),
                    Switch(
                      value: true,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveThumbColor: Colors.black,
                      onChanged: (v) {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Sistem Bildirimleri"),
                    const Spacer(),
                    Switch(
                      value: false,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveThumbColor: Colors.black,
                      onChanged: (v) {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Eposta & SMS"),
                    const Spacer(),
                    Switch(
                      value: false,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveThumbColor: Colors.black,
                      onChanged: (v) {},
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                PageSizedBox.heightS(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Diğer',
                          style: TextStyle(
                              color: Theme.of(context).shadowColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      PageSizedBox.heightL(),
                      Text('Güvenlik',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400)),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: PagePadding.verticalS(),
                        child: Text('Yardım',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400)),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: PagePadding.verticalS(),
                          child: Text('Hakkında',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
