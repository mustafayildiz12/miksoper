import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/core/constants/city_list.dart';
import 'package:miksoper/ui/pages/tabs/profile/defective_record_detail/defective_record_detail.dart';
import 'package:miksoper/ui/pages/widgets/my_primary_button.dart';
import 'package:miksoper/ui/pages/widgets/my_primary_form_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/helpers/providers/file_picker_provider.dart';
import '../../auth/login_page.dart';
import 'about_page.dart';

part 'modules/profile_button.dart';
part 'modules/document_dialog.dart';
part 'modules/profile_dialog.dart';
part 'modules/upload_document.dart';
part 'modules/defective_records.dart';
part 'modules/my_follows.dart';
part 'modules/app_settings.dart';
part 'modules/extention_dialogs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CityList cityList = CityList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: MyColors().grey_200,
            width: 100.w,
            height: 100.h,
          ),
          Container(
            width: 100.w,
            height: 25.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image_10.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 18.h,
            child: Container(
              width: 14.h,
              height: 14.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors().grey_200, width: 1.w),
                image: const DecorationImage(
                    image: AssetImage('assets/images/image_9.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 33.h,
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    "John Anderson",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  PageSizedBox.heightXS(),
                  Text(
                    "İstanbul",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: MyColors().grey_40),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 42.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ProfileButtons(
                  title: 'Profil Ayarları',
                  onTap: () {
                    _ProfileDialog(
                      cityList: cityList,
                    ).show(context);
                  },
                  iconData: Icons.person,
                ),
                _ProfileButtons(
                  title: 'Dökümanlar',
                  onTap: () {
                    const _DocumentDialog().show(context);
                  },
                  iconData: Icons.attach_file,
                ),
                _ProfileButtons(
                  title: 'Arıza Kayıtları',
                  onTap: () {
                    const _DefectiveRecordDocumentDialog().show(context);
                  },
                  iconData: Icons.devices,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 57.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ProfileButtons(
                  title: 'Takip Edilenler',
                  onTap: () {
                    const _MyFollowsDialog().show(context);
                  },
                  iconData: Icons.favorite,
                ),
                _ProfileButtons(
                  title: 'Ayarlar',
                  onTap: () {
                    const _AppSettings().show(context);
                  },
                  iconData: Icons.settings,
                ),
                _ProfileButtons(
                  title: 'Çıkış Yap',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                  iconData: Icons.power_settings_new,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
