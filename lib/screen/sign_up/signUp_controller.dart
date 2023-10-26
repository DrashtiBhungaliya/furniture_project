
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/utils/firebase_services.dart';
import 'package:get/get.dart' ;

import '../login_screen/login_screen.dart';

class SignUpController extends GetxController{
  TextEditingController fullNameController  = TextEditingController();
  TextEditingController emailController  = TextEditingController();
  TextEditingController passWordController  = TextEditingController();
Future<void> setData() async {
  Map<String,dynamic> data  = {
    "name":fullNameController.text.trim(),
    "email":emailController.text.trim(),
    "password":passWordController.text.trim(),
  };

  DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Drashti");
  String? key = databaseReference.push().key;
 await FireBaseServices.setData(databaseReference.child(key!), data);

  Get.to(const LoginScreen());
  update();
}
void navigation(){
  Get.to(const LoginScreen());
}
}