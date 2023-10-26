// ignore: file_names
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../login_screen/login_screen.dart';
import 'onboarding_controller.dart';

double h = Get.height;
double w = Get.width;

Widget backImage() {
  return GetBuilder<OnBoardingController>(
    id: "Update",
    builder: (controller) => Stack(
      children: [
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => controller.select(value),
          controller: controller.pageController,
          itemCount: controller.data.length,
          itemBuilder: (context, index) => Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(controller.data[index]['image']),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: h * 0.83,
          child: InkWell(
            onTap: () => controller.buttonOnTap(),
            child: button(
                data:
                    controller.pageIndex == 2 ? StringRes.sign : StringRes.next,
                icon:
                controller.pageIndex == 2 ? null : Icons.arrow_forward_outlined
            ),
          ),
        ),
        Positioned(
            top: h * 0.91,
            left: w * 0.45,
            child: controller.pageIndex == 2
                ? InkWell(
                    onTap: () => Get.to(() => const LoginScreen()),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: ColorRes.yellow,
                        fontFamily: "Avenir",
                      ),
                    ),
                  )
                : const SizedBox()),
        Positioned(
          top: h * 0.95,
          left: w * 0.45,
          child: SizedBox(
            height: h * 0.01,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(microseconds: 100),
                height: h * 0.0099,
                width: index == controller.pageIndex ? w * 0.05333 : w * 0.0213,
                margin: const EdgeInsets.only(left: 2, right: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: index == controller.pageIndex
                        ? ColorRes.yellow
                        : ColorRes.textGrey),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
