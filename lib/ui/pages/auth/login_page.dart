import 'package:flutter/material.dart';

import 'package:miksoper/ui/pages/auth/forgot_password.dart';
import 'package:miksoper/ui/pages/auth/register_page.dart';
import 'package:miksoper/ui/pages/tabs/tab_page/tabs_page.dart';
import 'package:miksoper/ui/pages/widgets/my_primary_text.dart';
import 'package:miksoper/ui/pages/widgets/my_primary_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/page_paddings.dart';
import '../../../core/constants/page_sized_box.dart';
import '../widgets/my_primary_form_field.dart';
import '../widgets/my_primary_button.dart';
import '../widgets/my_primary_images.dart';
import '../widgets/my_special_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  "Mixoper'e Hoşgeldin",
                  style: TextStyle(
                      color: _colors.bluegrey_800,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                PageSizedBox.heightXS(),
                const MyPrimaryText(text: "Hadi Giriş Yap"),
                PageSizedBox.height(15.h),
                MyPrimaryFormField(
                  onChanged: (p0) {},
                  label: 'Email',
                ),
                PageSizedBox.heightXS(),
                MyPrimaryFormField(
                  onChanged: (p1) {},
                  obscureText: true,
                  label: 'Password',
                ),
                PageSizedBox.heightXXS(),
                Align(
                  alignment: Alignment.centerRight,
                  child: MyPrimaryTextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      text: "Şifremi Unuttum"),
                ),
                //   PageSizedBox.heightXS(),
                MyPrimaryButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabsPage(),
                        ),
                        (route) => false);
                  },
                  title: "Giris",
                ),
                PageSizedBox.heightS(),
                const Center(
                  child: MyPrimaryTextThin(text: 'Veya'),
                ),
                PageSizedBox.heightXS(),
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
                PageSizedBox.heightXS(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyPrimaryTextThin(text: 'Üye Olmadın mı ?'),
                    MyPrimaryTextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      text: "Üye Ol",
                      color: _colors.pink_600,
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
