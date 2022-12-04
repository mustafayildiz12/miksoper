import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/core/constants/page_sized_box.dart';
import 'package:miksoper/ui/pages/widgets/my_primary_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/my_primary_form_field.dart';
import '../widgets/my_primary_button.dart';
import '../widgets/my_primary_images.dart';
import '../widgets/my_primary_text_button.dart';
import '../widgets/my_special_icons.dart';
import 'activation_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final MyColors _colors = MyColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: PagePadding.allM(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageSizedBox.heightM(),
                const MyPrimaryImage(
                  path: 'logos/logo_login',
                ),
                PageSizedBox.heightM(),
                Text(
                  "Üye Ol",
                  style: TextStyle(
                      color: _colors.bluegrey_800,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                PageSizedBox.heightXS(),
                const MyPrimaryText(text: "Sen de üye ol sorununa çözüm bul"),
                PageSizedBox.heightM(),
                MyPrimaryFormField(
                  onChanged: (p0) {
                    
                  },
                  label: 'İsim Soyisim',
                ),
                PageSizedBox.heightXS(),
                MyPrimaryFormField(
                  onChanged: (p1) {},
                  label: 'Email',
                ),
                PageSizedBox.heightXS(),
                MyPrimaryFormField(
                  onChanged: (p1) {},
                  label: 'Telefon',
                ),
                PageSizedBox.heightXS(),
                MyPrimaryFormField(
                  onChanged: (p1) {},
                  obscureText: true,
                  label: 'Parola',
                ),
                PageSizedBox.heightS(),
                const Center(child: MyPrimaryTextThin(text: 'Veya')),
                PageSizedBox.heightS(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    MySpecialIcon(
                      title: 'f',
                    ),
                    MySpecialIcon(
                      title: 'G',
                    ),
                  ],
                ),
                PageSizedBox.heightS(),
                MyPrimaryButton(
                  onPressed: () {
                    const _SuccessDialog().show(context);
                  },
                  title: "Üye Ol",
                ),
                PageSizedBox.heightXS(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyPrimaryTextThin(text: 'Zaten Üye misin0 ?'),
                    MyPrimaryTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      text: "Giriş Yap",
                      color: _colors.colorAccentDark,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors colors = MyColors();
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Column(
        children: [
          Container(
            color: colors.green_400,
            width: 100.w,
            height: 20.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 12.h,
                    child: Image.asset(
                      'assets/badges/badge_verified.png',
                      fit: BoxFit.fitHeight,
                    )),
                Text(
                  'İşlem Başarılı !',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: 100.w,
            height: 20.h,
            child: Column(
              children: [
                Padding(
                  padding:
                      PagePadding.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Text(
                    'Şifreniz email adresinize gönderilmiştir.Lütfen mailinizi kontrol edin',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(colors.green_400)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PinputExample(),
                        ),
                      );
                    },
                    child: const Text('TAMAM'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension ProfileDialogExtension on _SuccessDialog {
  show(BuildContext context) {
    showDialog(
      useSafeArea: false,
      barrierDismissible: false,
      context: context,
      builder: (context) => this,
    );
  }
}
