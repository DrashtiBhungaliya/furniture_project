import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../forgot_password/forgot_screen.dart';
import 'login_controller.dart';

double h = Get.height;
double w = Get.width;

Widget loginScreen() {
  return GetBuilder<LoginController>(builder: (controller) =>Padding(
    padding: EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commenIcon(onTap:()=>Get.back() ),
        Padding(
          padding:
          EdgeInsets.only(left: w * 0.04, top: h * 0.025, right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(StringRes.logIn),
              vertical(height: h * 0.07),
              textField(hintText: StringRes.email,textInputAction: TextInputAction.next,controller: controller.emailController),
              vertical(height: h * 0.03),
              textField(hintText: "Password",textInputAction: TextInputAction.done,controller: controller.passwordController),
              vertical(height: h * 0.06),
              commenButton("Login",onTap:controller.getData, ),
              vertical(height: h * 0.04),
              InkWell(
                onTap: ()=>Get.to(const ForgotScreen()),
                child: Center(
                    child: smallText(StringRes.forgot)
                ),
              ),
              vertical(height: h * 0.05),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Divider(
                      color: ColorRes.grey,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(color: ColorRes.grey),
                  ),
                  Expanded(
                    child: Divider(
                      color: ColorRes.grey,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              vertical(height: h * 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsRes.google, height: 50),
                  horizontal(width: w * 0.04),
                  Image.asset(AssetsRes.apple, height: 50),
                  horizontal(width: w * 0.04),
                  Image.asset(AssetsRes.faceBook, height: 50),
                ],
              ),
              vertical(height: h * 0.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    StringRes.account,
                    style: TextStyle(color: ColorRes.black,fontFamily: "Regular",fontSize: 16),
                  ),
                  InkWell(onTap:()=>controller.getData(),
                    child: const Text(
                      StringRes.signUp,
                      style: TextStyle(
                          color: ColorRes.black, fontWeight: FontWeight.w700,fontFamily: "Regular",fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  ),);
}
