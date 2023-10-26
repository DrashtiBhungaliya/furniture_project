import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import 'language_controller.dart';
import 'language_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenIcon(onTap:()=>Get.back() ),
           Padding(
             padding: EdgeInsets.only(left: w * 0.04, top: h * 0.025, right: w * 0.04),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               titleText(StringRes.language),
                 vertical(height: h*0.02),
               commenText("Suggested"),
                 radioList(),
                 vertical(height: h*0.02),
                 const Divider(color: ColorRes.grey),
                 vertical(height: h*0.02),
                 commenText(StringRes.language),
                 radioList1()

               ],
             ),
           )
          ],

        ),
      )
    );
  }
}
