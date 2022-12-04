import 'package:flutter/material.dart';

import 'package:miksoper/ui/pages/widgets/my_primary_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/page_paddings.dart';
import '../../../core/constants/page_sized_box.dart';
import '../widgets/my_primary_form_field.dart';
import '../widgets/my_primary_button.dart';
import '../widgets/my_primary_images.dart';
import '../widgets/my_primary_text_button.dart';
import '../widgets/success_dialog_title.dart';
import 'login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  "Şifremi Unuttum",
                  style: TextStyle(
                      color: _colors.bluegrey_400,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                PageSizedBox.heightXS(),
                const MyPrimaryText(
                    text:
                        "Şifreni sıfırlamak için email adresini aşağıdaki alana girin.."),
                PageSizedBox.height(25.h),
                MyPrimaryFormField(
                  onChanged: (p1) {},
                  label: 'Email',
                ),
                PageSizedBox.heightL(),
                MyPrimaryButton(
                  onPressed: () {
                    const _SuccessDialog().show(context);
                  },
                  title: "Parola Sıfırla",
                ),
                PageSizedBox.heightXS(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyPrimaryTextThin(text: 'Veya'),
                    MyPrimaryTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      // GoRouter.of(context).go('/login'),
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
          const SuccessDilogTitle(),
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
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

extension ForgotPasswordDialogExtension on _SuccessDialog {
  show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => this,
    );
  }
}
