import 'package:flutter/material.dart';
import 'package:furniture_project/screen/sign_up/signUp_controller.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<SignUpController>(builder: (controller) => Padding(
          padding:
          EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commenIcon(onTap: () => Get.back()),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.04, top: h * 0.025, right: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(
                      StringRes.signUp,
                    ),
                    vertical(height: h * 0.07),
                    textField(
                        hintText: StringRes.fullName,
                        textInputAction: TextInputAction.next,
                        controller: controller.fullNameController),
                    vertical(height: h * 0.03),
                    textField(
                        hintText: StringRes.email,
                        textInputAction: TextInputAction.next,
                        controller: controller.emailController),
                    vertical(height: h * 0.03),
                    textField(
                        hintText: StringRes.passWord,
                        textInputAction: TextInputAction.done,
                        controller: controller.passWordController),
                    vertical(height: h * 0.05),
                    GestureDetector(onTap:controller.setData,
                      child: commenButton(
                        StringRes.createAccount,

                      ),
                    ),
                    vertical(height: h * 0.04),
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
                    vertical(height: h * 0.13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          StringRes.already,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Avenir"),
                        ),
                        InkWell(
                          onTap: () => controller.navigation(),
                          child: const Text(
                            StringRes.logIn,
                            style: TextStyle(
                                color: ColorRes.yellow,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Avenir"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),),
      ),
    );
  }
}
