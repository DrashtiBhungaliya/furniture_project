import 'package:flutter/material.dart';
import 'package:furniture_project/screen/privacy_screen/privacy_controller.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: h * 0.05, left: w * 0.04, right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commenIcon(onTap:()=>Get.back() ),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.04, top: h * 0.02, right: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(StringRes.privacy),
                    vertical(height: h * 0.017),
                    commenText(StringRes.terms),
                    vertical(height: h * 0.014),
                    Text(
                      StringRes.descriptionTerms,
                      style: TextStyle(fontFamily: "Regular",
                          color: ColorRes.textGrey.withOpacity(0.5),

                          fontSize: 14),
                    ),vertical(height: h * 0.017),
                    Text(
                      StringRes.descriptionTerms,
                      style: TextStyle(fontFamily: "Regular",
                          color: ColorRes.textGrey.withOpacity(0.5),

                          fontSize: 14),
                    ),
                    vertical(height: h * 0.04),
                    commenText(StringRes.changeTerms),
                    vertical(height: h * 0.013),
                    Text(
                      StringRes.descriptionTerms,
                      style: TextStyle(fontFamily: "Regular",
                          color: ColorRes.textGrey.withOpacity(0.5),

                          fontSize: 14),
                    ),
                    vertical(height: h * 0.02),
                    Text(
                      StringRes.descriptionTerms,
                      style: TextStyle(fontFamily: "Regular",
                          color: ColorRes.textGrey.withOpacity(0.5),

                          fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
