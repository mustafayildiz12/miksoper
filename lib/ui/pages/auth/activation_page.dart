import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/page_paddings.dart';
import '../widgets/success_dialog_title.dart';
import 'activation_success.dart';

class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 7.h,
    height: 7.h,
    textStyle: TextStyle(
      fontSize: 22.sp,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: const Border.fromBorderSide(BorderSide(color: Colors.red)),
    ),
  );

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final MyColors _colors = MyColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Aktivasyon Girişi',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Image.asset(
                      'assets/images/img_code_verification.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text('Gelen kodu aşağıya girin',
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(
                    height: 2.1.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                        controller: pinController,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,

                        // onClipboardFound: (value) {
                        //   debugPrint('onClipboardFound: $value');
                        //   pinController.setText(value);
                        // },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: _colors.focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration?.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: _colors.focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration?.copyWith(
                            color: _colors.fillColor,
                            borderRadius: BorderRadius.circular(19),
                            border:
                                Border.all(color: _colors.focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              _colors.colorAccentDark)),
                      onPressed: () {
                        //  formKey.currentState!.validate();
                        const _SuccessDialog().show(context);
                      },
                      child: const Text('Gönder')),
                ],
              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivationSuccess(),
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
