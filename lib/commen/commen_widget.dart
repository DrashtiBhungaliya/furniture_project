import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../utils/color_res.dart';
import '../utils/string_res.dart';



double h = Get.height;
double w = Get.width;

Widget button({
  String? data,
  IconData? icon,
  bool isShowArrow = false,
}) {
  return Container(
    margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
    height: h * 0.065,
    width: w * 0.9,
    decoration: BoxDecoration(
      color: ColorRes.yellow,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(

      children: [
        Padding(
          padding:  EdgeInsets.only(left: h*0.15),
          child: Text(
            data!,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
        horizontal(width: w * 0.04),
        if(isShowArrow==true)
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ],
    ),
  );
}

Widget commenButton(String data,{ void Function()? onTap}) {
  return InkWell(
    onTap:onTap ,
    child: Container(
      alignment: Alignment.center,
      height: h * 0.058,
      width: w,
      decoration: BoxDecoration(
        color: ColorRes.yellow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        data,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: "Avenir",
        ),
      ),
    ),
  );
}

Widget horizontal({double? width}) {
  return SizedBox(
    width: width,
  );
}

Widget vertical({double? height}) {
  return SizedBox(
    height: height,
  );
}

Widget textField({String? hintText, TextInputAction? textInputAction,void Function(String)? onChanged,TextEditingController? controller}) {
  return TextField(textInputAction:textInputAction ,onChanged: onChanged,controller:controller ,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          fontFamily: "Avenir",
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    ),
  );
}

Widget titleText(String data) {
  return Text(
    data,
    style: const TextStyle(fontFamily: "Cambo", fontSize: 44.3),
  );
}

Widget smallText(String data) {
  return Text(
    data,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 15,
      fontFamily: "Avenir",
    ),
  );
}

Widget commonOtpTextField({
  void Function(String)? onChanged,
  TextEditingController? controller,
}) {
  return Container(
    height: Get.height * 0.045,
    width: Get.width * 0.14,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        onChanged: onChanged,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            bottom: h * 0.09,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorRes.darkYellow, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorRes.darkYellow, width: 1),
          ),
        ),
      ),
    ),
  );
}

Widget commenContainor({double? height, double? width, Widget? child}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: ColorRes.lightGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}

Widget commenText(String data) {
  return Text(
    data,
    style: const TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 15),
  );
}

Widget commenSettingContainor(
    {required String image,
    required String data,
    Widget? trailing,
    double? height}) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: w * 0.06, right: w * 0.04),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    tileColor: ColorRes.grey,
    leading: Image.asset(
      image,
      height: height,
    ),
    title: commenText(data),
    trailing: trailing,
  );
}

Widget commenAccountContainor(
    {required String image,
    required String data,
    required String data1,
    double? height}) {
  return ListTile(dense: true,
      contentPadding: EdgeInsets.only(left: w * 0.06, right: w * 0.04, bottom: h*0.0,top: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: ColorRes.grey,
      leading: Image.asset(
        image,
        height: height,
      ),
      subtitle: greyText(data1),
      title: commenText(data),
      trailing: const Icon(
        Icons.arrow_right,
        size: 30,
      ));
}

Widget greyText(String data) {
  return Text(
    data,
    style:
        const TextStyle(color: ColorRes.textGrey, fontSize: 11.5, fontFamily: "Avenir"),
  );
}
Widget commenIcon({void Function()? onTap}){
  return  InkWell(
    onTap:onTap ,
    child: const Icon(
      Icons.close,
      size: 30,
    ),
  );
}

Widget totalText() {
  return Padding(
    padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
    child: Column(
      children: [
        const Row(
          children: [
            Text(
              StringRes.shippingFree,
              style: TextStyle(
                  color: ColorRes.textGrey,
                  fontFamily: "Regular",
                  fontSize: 15),
            ),
            Spacer(),
            Text(
              "\$6.99",
              style: TextStyle(
                  color: ColorRes.textGrey, fontFamily: "Avenir", fontSize: 16),
            ),
          ],
        ),
        const  Row(
          children: [
            Text(
              StringRes.subTotal,
              style: TextStyle(
                  color: ColorRes.textGrey,
                  fontFamily: "Regular",
                  fontSize: 15),
            ),
            Spacer(),
            Text(
              "\$79.99",
              style: TextStyle(
                  color: ColorRes.textGrey, fontFamily: "Avenir", fontSize: 16),
            ),
          ],
        ),
        vertical(height: h * 0.01),
        const   Row(
          children: [
            Text(
              StringRes.total,
              style: TextStyle(
                  color: Colors.black, fontFamily: "Avenir", fontSize: 16),
            ),
            Spacer(),
            Text(
              "\$86.98",
              style: TextStyle(
                  color: Colors.black, fontFamily: "Avenir", fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}
Widget commenBottom(String? data){
  return  Container(
    height: h * 0.07,
    width: w,
    color: ColorRes.yellow,
    child: Center(
      child: Text(
        data!,
        style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15
        ),
      ),
    ),
  );
}