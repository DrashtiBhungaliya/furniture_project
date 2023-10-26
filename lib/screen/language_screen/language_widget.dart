import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import 'language_controller.dart';

Widget radioList() {
  return GetBuilder<LanguageController>(
    builder: (controller) => ListView.separated(shrinkWrap: true,
        itemBuilder: (context, index) =>  Row(
          children: [
            Text(controller.country[index]),
            const Spacer(),
            SizedBox(height: 20,
              child: Checkbox(activeColor:  ColorRes.yellow,
                value: controller.checked[index],
                onChanged: (value) => controller.selectValue(value, index),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),    separatorBuilder: (context, index) => vertical(height: 20),
        itemCount: controller.country.length),
  );
}

Widget radioList1() {
  return GetBuilder<LanguageController>(
    builder: (controller) => ListView.separated(shrinkWrap: true,
        itemBuilder: (context, index) => Row(
              children: [
                Text(controller.language[index]),
                const Spacer(),
                SizedBox(height: 20,
                  child: Checkbox(activeColor:  ColorRes.yellow,
                    value: controller.isChecked[index],
                    onChanged: (value) => controller.selectValue1(value, index),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
        separatorBuilder: (context, index) => vertical(height: 20),
        itemCount: controller.language.length),
  );
}
