import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'onBoarding_widget.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        body: backImage(),
    );
  }
}
