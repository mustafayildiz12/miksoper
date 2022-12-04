import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/city_list.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/ui/pages/widgets/fake_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';

class PostDefective extends StatefulWidget {
  const PostDefective({Key? key}) : super(key: key);

  @override
  _PostDefectiveState createState() => _PostDefectiveState();
}

class _PostDefectiveState extends State<PostDefective> {
  final CityList cityList = CityList();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = cityList.sehirler.first;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FakeBar(),
            Padding(
              padding: PagePadding.allM(),
              child: Column(
                children: [
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Arıza Başlığı giriniz',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                    ),
                  ),
                  PageSizedBox.heightM(),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Arıza ara',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                    ),
                  ),
                  PageSizedBox.height(10.h),
                  Card(
                    color: Colors.white,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      isExpanded: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: cityList.sehirler
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: PagePadding.horizontalM(),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  PageSizedBox.heightM(),
                  TextFormField(
                    minLines: 3,
                    maxLines: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Arıza Detayı giriniz',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                    ),
                  ),
                  PageSizedBox.heightM(),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(90.w, 6.h)),
                      shape: const MaterialStatePropertyAll(StadiumBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(MyColors().grey_90),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostDefective(),
                        ),
                      );
                    },
                    child: const Text('Arızayı Oluştur'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
