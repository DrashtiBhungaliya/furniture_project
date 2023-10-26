import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/screen/forgot_password/forgot_controller.dart';

import 'package:furniture_project/screen/pin_screen/pin_controller.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

import '../newPass_screen/newPass_screen.dart';

double h = Get.height;
double w = Get.width;

Widget pinScreen(BuildContext context) {
  return GetBuilder<PinController>(
    builder: (controller) => Padding(
      padding: EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commenIcon(onTap: () => Get.back()),
          Padding(
            padding: EdgeInsets.only(
                left: w * 0.05, top: h * 0.025, right: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(StringRes.pin),
                smallText(StringRes.digit),
                vertical(height: h * 0.04),
                Pinput(
                  onChanged: (value) => controller.onChange(value),
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                ),
                vertical(height: h * 0.035),
                commenButton(
                  StringRes.toContinue,
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: ForgotController.verify,
                              smsCode: controller.code);
                      await controller.auth.signInWithCredential(credential);
                      Get.to(() => NewPassScreen());
                    } catch (e) {
                      print("wrong otp");
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

final defaultPinTheme = PinTheme(
  width: 60,
  height: 45,
  textStyle: const TextStyle(
      fontSize: 20, color: ColorRes.black, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: ColorRes.yellow),
    borderRadius: BorderRadius.circular(10),
  ),
);
