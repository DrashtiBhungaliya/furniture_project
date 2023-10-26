import 'package:flutter/material.dart';
import 'package:furniture_project/screen/changePass_screen/pass_controller.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/string_res.dart';

class PassWordScreen extends StatelessWidget {
  const PassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePassController());
    return GestureDetector(  behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: h * 0.07,
                left: w * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commenIcon(onTap:()=>Get.back() ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.04,
                      top: h * 0.018,
                    ),
                    child: titleText(StringRes.changePassword),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.04,
                      top: h * 0.018,
                      right: w * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commenText(StringRes.passWord),
                        textField(textInputAction: TextInputAction.next),
                        vertical(height: h * 0.03),
                        commenText(StringRes.newPassWord),
                        textField(),
                        vertical(height: h * 0.03),
                        commenText(StringRes.confirmPassWord),
                        textField(),
                      ],
                    ),
                  )
                ],
              ),
            ),
           const Spacer(),
          commenBottom(  StringRes.savePassword,)
          ],
        ),
      ),
    );
  }
}
