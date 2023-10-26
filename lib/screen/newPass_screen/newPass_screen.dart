// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/string_res.dart';
import '../login_screen/login_screen.dart';

class NewPassScreen extends StatelessWidget {
   NewPassScreen({super.key});

  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(  behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),


      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commenIcon(onTap:()=>Get.back() ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.04, top: h * 0.025, right: w * 0.04),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(StringRes.newPassWord),
                    vertical(height: h*0.07),
                    textField(hintText: StringRes.passWord),
                    vertical(height: h*0.03),
                    textField(hintText: StringRes.confirmPassWord),
                    vertical(height: h*0.05),
                    commenButton(StringRes.confirm,onTap: () => Get.to(const LoginScreen()),)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
