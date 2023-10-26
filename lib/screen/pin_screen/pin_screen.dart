import 'package:flutter/material.dart';
import 'package:furniture_project/screen/pin_screen/pin_controller.dart';
import 'package:furniture_project/screen/pin_screen/pin_widget.dart';

import 'package:get/get.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PinController());
    return Scaffold(
      body: pinScreen(context),
    );
  }
}
