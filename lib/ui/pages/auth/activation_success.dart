import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/ui/pages/auth/login_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActivationSuccess extends StatefulWidget {
  const ActivationSuccess({Key? key}) : super(key: key);

  @override
  _ActivationSuccessState createState() => _ActivationSuccessState();
}

class _ActivationSuccessState extends State<ActivationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: PagePadding.customAll(5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70.w,
              child: Image.asset('assets/images/activation_ok.png'),
            ),
            Text(
              "Aktivasyon Başarılı !",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: MyColors().colorAccentDark,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: PagePadding.symmetric(horizontal: 5.w),
              child: Text(
                "Email adresiniz doğrulanmıştır.Giriş yapabilirsiniz.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    minimumSize: MaterialStateProperty.all(Size(45.w, 5.h)),
                    backgroundColor:
                        MaterialStateProperty.all(MyColors().colorAccentDark)),
                onPressed: () {
                  //  formKey.currentState!.validate();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false);
                },
                child: const Text('Giriş Yap')),
          ],
        ),
      ),
    );
  }
}
