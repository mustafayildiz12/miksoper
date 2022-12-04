import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {
                  Navigator.pop(context);
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        width: 100.w,
        height: 100.h,
        child: Padding(
          padding:  PagePadding.allM(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageSizedBox.height(8.h),
              SizedBox(
                  width: 40.w,
                  child: Text(
                    "Merhaba Sorununa uygun Çözümü ara !",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyColors().colorPrimary),
                  )),
              PageSizedBox.height(3.h),
              TextFormField(
                controller: _searchController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    hintText: 'Arama Yap',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade800,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(9.w)))),
              ),
              PageSizedBox.height(3.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 2.h,
                children: <Widget>[
                  _BuildChip(
                      label: 'Nokia', searchController: _searchController),
                  _BuildChip(
                      label: 'IphoneX', searchController: _searchController),
                  _BuildChip(
                      label: 'Samsung', searchController: _searchController),
                  _BuildChip(
                      label: 'Xiaomi', searchController: _searchController),
                  _BuildChip(
                      label: 'Google Pixel',
                      searchController: _searchController),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildChip extends StatefulWidget {
  const _BuildChip(
      {required this.label, required this.searchController, Key? key})
      : super(key: key);
  final String label;

  final TextEditingController searchController;

  @override
  State<_BuildChip> createState() => _BuildChipState();
}

class _BuildChipState extends State<_BuildChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.searchController.text = widget.label;
        setState(() {});
      },
      child: Chip(
        labelPadding: const EdgeInsets.all(2.0),
        label: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Colors.white,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: PagePadding.customAll(3.w),
      ),
    );
  }
}
