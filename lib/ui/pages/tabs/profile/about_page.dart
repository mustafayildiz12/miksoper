import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: PagePadding.only(left: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mixoper App",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            PageSizedBox.heightM(),
            Text(
              "Version",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "3.24.0.11.1",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            PageSizedBox.heightM(),
            Text(
              "Son Görülme",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "Kasım 2021",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            PageSizedBox.heightM(),
            Text(
              "Mixoper ile kullandığın ürünlerin ...",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            PageSizedBox.heightM(),
            Text(
              "Gebze/Kocaeli",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
