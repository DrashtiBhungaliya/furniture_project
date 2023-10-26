import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import 'filter_controller.dart';
import 'filter_widget.dart';

class FilterScreen  extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FilterController());
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commenIcon(onTap:()=>Get.back() ),
                   Padding(
                     padding: EdgeInsets.only(left: w * 0.04, top: h * 0.02, right: w * 0.04,bottom: h*0.04),
                     child: titleText(StringRes.filters),
                   ),
                  commenText(StringRes.brand),
                 vertical(height: h*0.02),
                 Row(
                   children: [
                     blackContainor("Hooker"),
                     horizontal(width: w*0.04),
                     blackContainor("Aspen"),
                     const Spacer(),
                     const Icon(Icons.arrow_right,size: 25,)
                   ],
                 ),
                  vertical(height: h*0.03),
                  commenText(StringRes.cat),
                  vertical(height: h*0.02),
                  Row(
                    children: [
                      blackContainor("Decoration"),
                      horizontal(width: w*0.04),
                      blackContainor("Lamp"),
                      const Spacer(),
                      const Icon(Icons.arrow_right,size: 25,)
                    ],
                  ),
                  vertical(height: h*0.03),
                  commenText("Colors"),
                  vertical(height: h*0.02),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     circle(backgroundColor: Colors.black,border: Border.all(width: 1,color: ColorRes.black),),
                     circle(backgroundColor: const Color(0xff007AFF)),
                     circle(backgroundColor: const Color(0xffFF9500)),
                     circle(backgroundColor: const Color(0xffFF2D55),),
                     circle(backgroundColor: const Color(0xff5856D6),),
                     circle(backgroundColor: const Color(0xff5AC8FA),),
                     circle(backgroundColor: const Color(0xffD2D5DB),),
                   ],
                 ),
                  vertical(height: h*0.03),
                  commenText(StringRes.filterBy),
                  rangeSlider(),
                ],
              ),
            ),
            const Spacer(),
            commenBottom("Apply")
          ],
        ),
    );
  }
}
