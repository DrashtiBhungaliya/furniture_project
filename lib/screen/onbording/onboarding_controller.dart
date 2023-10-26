import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/assets_res.dart';
import '../../utils/string_res.dart';
import '../sign_up/signup_screen.dart';

class OnBoardingController extends GetxController {
  int pageIndex = 0;
  PageController pageController = PageController();

  void select(dynamic value) {
    pageIndex = value;
    update(["Update"]);
  }

  void buttonOnTap() {
    if (pageIndex != 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
    } else if (pageIndex == 2) {
      Get.to(()=>SignUpScreen());
    } else {
      null;
    }
  }

  List<Map> data = [
    {
      'image': AssetsRes.onBoarding,
      'title': StringRes.change,
      "subTitle": StringRes.makeArt,
    },
    {
      'image': AssetsRes.onBoarding2,
      'title': StringRes.change2,
      "subTitle": "",
    },
    {
      'image': AssetsRes.onBoarding3,
      'title': "",
      "subTitle": StringRes.comfort,
    }
  ];
}
