import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/screen/forgot_password/forgot_controller.dart';
import 'package:furniture_project/screen/pin_screen/pin_screen.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';


double h = Get.height;
double w = Get.width;

Widget forgotScreen(){
  return GetBuilder<ForgotController>(builder: (controller) => Padding(
    padding:  EdgeInsets.only(top: h * 0.07, left: w * 0.03, right: w * 0.04),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commenIcon(onTap:()=>Get.back() ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.035, top: h * 0.025, right: w * 0.03),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(StringRes.forgotPassWord),
              vertical(height: h*0.015),
              smallText(StringRes.pleaseEnter),
              vertical(height: h*0.01),
              textField(hintText:"Phone",onChanged: (value) =>controller.onChange(value),controller: controller.countryCode),
              vertical(height: h*0.05),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(

                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: controller.countryCode.text.trim(),
                      verificationCompleted: (PhoneAuthCredential credential) async {
                        await FirebaseAuth.instance.signInWithCredential(credential);
                      },
                      verificationFailed:(FirebaseAuthException e) {
                        if(e.code=="invalid-phone-number"){
                          Get.snackbar("csxc", "cdascdas");
                        }else{
                          Get.snackbar("hello", "Hello");
                        }
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        ForgotController.verify=verificationId;
                       Get.to(()=>const PinScreen());
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorRes.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Text("Send",style: TextStyle(color: ColorRes.white,fontFamily: "Avenir"),),
                ),
              )
            ],
          ),
        )
      ],
    ),
  ),);
}