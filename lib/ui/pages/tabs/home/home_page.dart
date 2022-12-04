import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:sizer/sizer.dart';

part 'modules/comment_item_card.dart';
part 'modules/primary_jpg_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:  PagePadding.allM(),
            child: Column(
              children: [
                 PageSizedBox.heightM(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Popüler',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                 PageSizedBox.heightS(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          12,
                          (index) => _MyPrimaryJpgImage(
                              path: 'images/image_${index + 1}'))),
                ),
                 PageSizedBox.heightM(),
                ListTile(
                  contentPadding:  PagePadding.allXS(),
                  title: Text('Konuşuluyor',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Text('En çok yorum alanlar',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                 PageSizedBox.heightS(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => _CommentsItemCard(
                            width: 100.w, path: 'images/image_${index + 1}')),
                  ),
                ),
                 PageSizedBox.heightM(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('En İyiler',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                 PageSizedBox.heightS(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => _CommentsItemCard(
                            width: 60.w, path: 'images/image_${index + 1}')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
