import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import 'check_out_controller.dart';

Widget commenShipping({
  required bool? value,
  required void Function(bool?)? onChanged,
  String? image,
  String? data1,
  String? data2,
  double? width,
}) {
  return Container(
    height: h * 0.09,
    width: width,
    decoration: BoxDecoration(
      color: ColorRes.grey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        horizontal(width: w * 0.035),
        Container(
          padding: const EdgeInsets.all(10),
          height: h * 0.064,
          width: w * 0.127,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Image.asset(image!),
        ),
        horizontal(width: w * 0.035),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vertical(height: h * 0.02),
            commenText(data1!),
            Text(
              data2!,
              style: const TextStyle(
                  fontFamily: "Regular",
                  color: ColorRes.textGrey,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        horizontal(width: w * 0.03),
        SizedBox(
          height: 20,
          child: Checkbox(
            side: BorderSide.none,
            activeColor: ColorRes.yellow,
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addressListView() {
  return GetBuilder<CheckOutController>(
    builder: (controller) => SizedBox(
      height: h * 0.09,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.address.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => commenShipping(
          image: AssetsRes.home,
          value: controller.checked[index],
          data1: "658 Yost Island Apt",
          width: w * 0.74,
          data2: "Seattle, US",
          onChanged: (value) => controller.selectValue(value, index),
        ),
        separatorBuilder: (context, index) => horizontal(width: w * 0.03),
      ),
    ),
  );
}

Widget addressListView1() {
  return GetBuilder<CheckOutController>(
    builder: (controller) => Container(
      padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.address.length,

        itemBuilder: (context, index) => CheckboxListTile(
          contentPadding: const EdgeInsets.only(right: 2, left: 10),
          secondary: Container(
            padding: const EdgeInsets.all(10),
            height: h * 0.064,
            width: w * 0.127,
            decoration: BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Image.asset(controller.address[index]["Image"].toString()),
          ),
          subtitle: Text(
            controller.address[index]["SubTitle"].toString(),
            style: const TextStyle(
                fontFamily: "Regular",
                color: ColorRes.textGrey,
                fontWeight: FontWeight.w500,
                height: 2),
          ),
          title:  Text(
            controller.address1[index]["Title"].toString(),
            style: const TextStyle(color: Colors.black, fontFamily: "Avenir",fontSize: 14),
          ),
          value: controller.checked[index],
          activeColor: ColorRes.yellow,
          tileColor: ColorRes.grey,
          side: BorderSide.none,
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onChanged: (value) => controller.selectValue(value, index),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        separatorBuilder: (context, index) => vertical(height: 10),
      ),
    ),
  );
}

Widget addressListView2() {
  return GetBuilder<CheckOutController>(
    builder: (controller) => Row(
      children: [
        SizedBox(
          width: w * 0.07,
        ),
        Expanded(
          child: SizedBox(
            height: h * 0.09,
            child: ListView.separated(
              //shrinkWrap: true,
              itemCount: controller.address1.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: w * 0.75,
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.only(right: 0, left: w*0.03,),
                  secondary: Container(
                    padding: const EdgeInsets.all(10),
                    height: h * 0.064,
                    width: w * 0.127,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Image.asset(
                        controller.address1[index]["Image"].toString()),
                  ),
                  subtitle: Text(
                    controller.address1[index]["SubTitle"].toString(),
                    style: const TextStyle(
                        fontFamily: "Regular",
                        color: ColorRes.textGrey,
                        fontWeight: FontWeight.w500,
                        height: 2),
                  ),
                  title: Text(
                    controller.address1[index]["Title"].toString(),
                    style: const TextStyle(color: ColorRes.black, fontFamily: "Avenir",fontSize: 14),
                  ),
                  value: controller.isChecked[index],
                  activeColor: ColorRes.yellow,
                  tileColor: ColorRes.grey,
                  side: BorderSide.none,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onChanged: (value) => controller.selectValue1(value, index),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => horizontal(width: w * 0.03),
            ),
          ),
        ),
      ],
    ),
  );
}
