import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final oneController = TextEditingController();
  final twoController = TextEditingController();
  final threeController = TextEditingController();
  final fourController = TextEditingController();

  @override
  void dispose() {
    oneController.dispose();
    twoController.dispose();
    threeController.dispose();
    fourController.dispose();
    super.dispose();
  }

  Widget buildOTPTextField(TextEditingController controller, {last = false}) {
    return Expanded(
      child: CustomTextFormField(
        label: '',
        autoFocus: true,
        controller: controller,
        textInputType: TextInputType.number,
        textInputAction: last ? TextInputAction.done : TextInputAction.next,
        showlableOutside: false,
        showlable: false,
        borderThickness: 4,
        validator: (value) {
          return Validators.validateNumberField(value, false, false);
        },
        maxLength: 1,
        showCounter: false,
        // fillColor: const Color(0xFFF7F7F7),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        showClearIcon: false,
        showSuffix: false,
        innerTextStyle: FontSizes.h8,
        onSaved: (value) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(
          title: '',
        ),
        body: Padding(
          padding: CustomEdgeInsets.all(8.0),
          child: CustomForm(
            saveButtonText: 'Reset Password'.toUpperCase(),
            save: () async {},
            childrenAfterSaveButton: const [
              VerticalSizedBox(10),
            ],
            children: [
              const VerticalSizedBox(30),
              Text(
                "Verify Account",
                textAlign: TextAlign.start,
                style: FontSizes.h2?.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(10),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                      'Verify your account by entering verification code we sent to',
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: ' ecoin@etrevago.com',
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF022939),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(100),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const HorizantalSizedBox(25),
                  buildOTPTextField(oneController),
                  const HorizantalSizedBox(25),
                  buildOTPTextField(twoController),
                  const HorizantalSizedBox(25),
                  buildOTPTextField(threeController),
                  const HorizantalSizedBox(25),
                  buildOTPTextField(fourController),
                  const HorizantalSizedBox(25),
                ],
              ),
              const VerticalSizedBox(30),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  CustomTextButton(
                    title: 'Resend',
                    style: TextButton.styleFrom(
                      textStyle: FontSizes.h8?.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const VerticalSizedBox(30),
              const _CountDown(),
              const VerticalSizedBox(100),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountDown extends StatefulWidget {
  const _CountDown();

  @override
  State<_CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<_CountDown> {
  var enableBtn = false;
  var secRemaining = 0;
  var expoRemain = 90;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      startTimer();
    });
  }

  @override
  void dispose() {
    if (timer?.isActive ?? false) timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    // expoRemain *= 2;
    secRemaining = expoRemain;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (secRemaining > 0) {
          setState(() {
            secRemaining--;
          });
        } else {
          setState(() {
            enableBtn = true;
            timer?.cancel();
          });
        }
      },
    );
  }

  String convertToMinutes(String val) {
    return val.substring(0, val.indexOf(':', 3));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Resend in ${convertToMinutes(secRemaining.minutes.toString())} You did not receive the code",
      textAlign: TextAlign.center,
      style: FontSizes.h8?.copyWith(
        fontWeight: FontWeight.w400,
        color: const Color(0xff6B6B6B),
      ),
    );
  }
}
