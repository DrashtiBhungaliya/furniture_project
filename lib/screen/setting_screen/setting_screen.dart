
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:furniture_project/screen/setting_screen/setting_controller.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../account_screen/account_screen.dart';
import '../privacy_screen/privacy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      body: GetBuilder<SettingController>(
        id: "Switch",
        builder: (controller) => Padding(
          padding:
              EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commenIcon(onTap: () => Get.back()),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.05, top: h * 0.018, right: w * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText("Text6".tr),
                    vertical(height: h * 0.03),
                    InkWell(
                      onTap: () => Get.to(const AccountScreen()),
                      child: commenSettingContainor(
                        image: AssetsRes.s1,
                        data: "Text".tr,
                        trailing: const Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                    ),
                    vertical(height: h * 0.012),
                    commenSettingContainor(
                      height: 20,
                      image: AssetsRes.s2,
                      data: "Text1".tr,
                      trailing:  Padding(
                        padding: EdgeInsets.only(right: w * 0.03),
                        child: SizedBox(
                          width: w * 0.06,
                          child: ObxValue(
                                (data) => FlutterSwitch(
                              value: controller.lang.value,
                              height: 15,
                              width: 23,
                              toggleSize: 7,
                              padding: 3,
                              activeColor: Colors.grey.withOpacity(0.5),
                              inactiveColor: Colors.grey.withOpacity(0.5),
                              onToggle: (val) {
                                controller.onChangedLan(val);
                              },
                            ),
                            true.obs,
                          ),
                        ),
                      ),
                    ),
                    vertical(height: h * 0.012),
                    commenSettingContainor(
                      height: 20,
                      image: AssetsRes.s3,
                      data: "Text2".tr,
                      trailing: Padding(
                        padding: EdgeInsets.only(right: w * 0.03),
                        child: SizedBox(
                          width: w * 0.06,
                          child: ObxValue(
                            (data) => FlutterSwitch(
                              value: controller.light.value,
                              height: 15,
                              width: 23,
                              toggleSize: 7,
                              padding: 3,
                              activeColor: Colors.grey.withOpacity(0.5),
                              inactiveColor: Colors.grey.withOpacity(0.5),
                              onToggle: (val) {
                                controller.onChanged(val);
                              },
                            ),
                            true.obs,
                          ),
                        ),
                      ),
                    ),
                    vertical(height: h * 0.05),
                    commenSettingContainor(
                      height: 20,
                      image: AssetsRes.s4,
                      data:"Text3".tr,
                      trailing: const Icon(
                        Icons.arrow_right,
                        size: 30,
                      ),
                    ),
                    vertical(height: h * 0.012),
                    InkWell(
                      onTap: () => Get.to(const PrivacyScreen()),
                      child: commenSettingContainor(
                        height: 20,
                        image: AssetsRes.s5,
                        data:"Text4".tr,
                        trailing: const Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                    ),
                    vertical(height: h * 0.012),
                    commenSettingContainor(
                      height: 20,
                      image: AssetsRes.s6,
                      data:"Text5".tr,
                      trailing: const Icon(
                        Icons.arrow_right,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
