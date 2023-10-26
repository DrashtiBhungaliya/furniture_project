

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import 'filter_controller.dart';

Widget blackContainor(String data) {
  return Container(
    padding: EdgeInsets.only(
        left: w * 0.06, right: w * 0.06, top: h * 0.002, bottom: h * 0.002),
    decoration: BoxDecoration(
        color: ColorRes.black, borderRadius: BorderRadius.circular(5)),
    child: Text(
      data,
      style:
          const TextStyle(color: ColorRes.white, fontFamily: "Regular", fontSize: 14),
    ),
  );
}

Widget circle({BoxBorder? border, Color? backgroundColor}) {
  return Container(
    padding: const EdgeInsets.all(2.5),
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: border,
    ),
    child: CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 15,
    ),
  );
}

Widget rangeSlider() {
  return GetBuilder<FilterController>(
    builder: (controller) => SfRangeSlider(
      activeColor: ColorRes.black,
      inactiveColor: ColorRes.grey,
      min: 50.0,
      max: 1000.0,
      values: controller.changeValue,
      showTicks: false,
      showLabels: true,
      enableTooltip: true,
      dragMode: SliderDragMode.both,
      trackShape: const SfTrackShape(),

      onChanged: (SfRangeValues values) => controller.onChange(values),
    ),
  );
}
