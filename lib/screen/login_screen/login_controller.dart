import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_project/screen/home_screen/home_screen.dart';
import 'package:furniture_project/utils/firebase_services.dart';
import 'package:get/get.dart';
import '../../utils/pref_services.dart';
import '../sign_up/signup_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> getData() async {
    List<Map> userDataList = [];
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('Drashti');
    Map? allData = await FireBaseServices.getData(databaseReference);

    allData!.forEach((key, value) {
      value['id'] = key;
      userDataList.add(value);
    });

    bool checkLoginData = userDataList.any(
      (element) =>
          element['email'] == emailController.text &&
          element['password'] == passwordController.text,
    );

    if (checkLoginData) {
      await PreferenceService.setValue('isLogin', true);
      int loginDataIndex = userDataList.indexWhere(
        (element) =>
            element['email'] == emailController.text &&
            element['password'] == passwordController.text,
      );
      Map loginUser = userDataList[loginDataIndex];
      String loginUserId = loginUser['id'];
      await PreferenceService.setValue('loginUserId', loginUserId);
      Get.offAll(() => HomeScreen(cart: []));
    } else {
      Get.snackbar('Login Failed!!!', 'Please Enter Correct Data');
    }
  }

  void navigation() {
    Get.to(() => SignUpScreen());
  }
}
