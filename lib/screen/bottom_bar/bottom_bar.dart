import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import 'bottomBar_controller.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomBarController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: GetBuilder<BottomBarController>(
        id: "Bottom",
        builder: (controller) => Container(color: ColorRes.white,
          height: h * 0.083,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => controller.home(),
                child: Image.asset(
                  controller.index == 0 ? AssetsRes.h2 : AssetsRes.h1,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () => controller.direc(),
                child: Image.asset(
                  controller.index == 1 ? AssetsRes.d2 : AssetsRes.d1,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () => controller.bag(),
                child: Image.asset(
                  controller.index == 2 ? AssetsRes.b2 : AssetsRes.b1,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () => controller.notification(),
                child: Image.asset(
                  controller.index == 3 ? AssetsRes.n2 : AssetsRes.n1,
                  height: 30,
                ),
              ),
              InkWell(
                  onTap: () => controller.profile(),
                  child: controller.index == 4
                      ? Image.asset(
                          AssetsRes.p1,
                          height: 30,
                          color: ColorRes.yellow,
                        )
                      : Image.asset(
                          AssetsRes.p1,
                          height: 30,
                        )),
            ],
          ),
        ),
      ),
      body: GetBuilder<BottomBarController>(
        id: "Bottom",
        builder: (controller) => controller. screen[controller.index],
      ),
    );
  }
}
