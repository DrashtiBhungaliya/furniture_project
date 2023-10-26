import 'package:flutter/material.dart';
import 'package:furniture_project/screen/edit_screen/edit_controller.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

Widget nameRow() {
  return GetBuilder<EditController>(id: "Update",
    builder: (controller) => Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenText(StringRes.firstName),
            SizedBox(
                width: 130,
                child: commenTextField(
                    hintText: "Garrett",
                    textInputAction: TextInputAction.next,
                    controller: controller.nameController),),
          ],
        ),
        horizontal(width: w * 0.09),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenText(StringRes.lastName),
            SizedBox(
                width: 130,
                child: commenTextField(
                    hintText: "Miller", textInputAction: TextInputAction.next),),
          ],
        )
      ],
    ),
  );
}

Widget dobField() {
  return SizedBox(
    height: h * 0.065,
    child: TextField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "09 February 1998",
        suffixIcon: const Icon(Icons.arrow_drop_down),
        hintStyle: const TextStyle(
            color: ColorRes.black, fontSize: 14, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorRes.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorRes.grey, width: 2),
        ),
      ),
    ),
  );
}

Widget commenTextField(
    {String? hintText,
    TextInputAction? textInputAction,
    TextEditingController? controller}) {
  return TextField(
    textInputAction: textInputAction,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.only(top: h * 0.01),
      hintStyle: const TextStyle(
          color: ColorRes.black, fontSize: 14, fontWeight: FontWeight.w400),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorRes.black.withOpacity(0.2),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorRes.black.withOpacity(0.2),
        ),
      ),
    ),
  );
}

Widget buttonRow() {
  return Row(
    children: [
      Card(
        shadowColor: Colors.black.withOpacity(0.6),
        elevation: 5,
        child: Container(
          height: h * 0.045,
          width: w * 0.33,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: commenText(StringRes.male),
          ),
        ),
      ),
      horizontal(width: w * 0.06),
      Container(
        height: h * 0.045,
        width: w * 0.33,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(13)),
        child: Center(
          child: commenText(StringRes.female),
        ),
      ),
    ],
  );
}
