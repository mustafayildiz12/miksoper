part of '../profile.dart';

class _ProfileDialog extends StatelessWidget {
  const _ProfileDialog({required this.cityList});
  final CityList cityList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profili Düzenle"),
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
                Container(
                  height: 14.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 0.5.w, color: Theme.of(context).cardColor),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).cardColor,
                    size: 32.sp,
                  )),
                ),
                PageSizedBox.heightM(),
                MyPrimaryFormField(onChanged: (v) {}, label: 'İsim Soyisim'),
                PageSizedBox.heightM(),
                MyPrimaryFormField(onChanged: (v) {}, label: 'Telefon'),
                MyPrimaryFormField(onChanged: (v) {}, label: 'Email'),
                MyPrimaryFormField(
                    obscureText: true, onChanged: (v) {}, label: 'Parola'),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: cityList.sehirler.first,
                        isExpanded: true,
                        isDense: false,
                        items: cityList.sehirler.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    PageSizedBox.widthM(),
                    Expanded(
                      child: MyPrimaryFormField(
                          obscureText: true,
                          onChanged: (v) {},
                          label: 'Posta Kodu'),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: cityList.countries.first,
                  isExpanded: true,
                  isDense: false,
                  items: cityList.countries.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                PageSizedBox.heightM(),
                MyPrimaryButton(title: 'Kaydet', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
