
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController{
TextEditingController countryCode = TextEditingController();
static String verify = "";
@override
  void onInit() {
    // TODO: implement onInit
 // countryCode.text = "+91";
    super.onInit();
  }
var phone;
void onChange(value){
  phone = value;
}
}