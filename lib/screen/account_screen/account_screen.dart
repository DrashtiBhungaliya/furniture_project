import 'package:flutter/material.dart';
import 'package:furniture_project/screen/account_screen/account_controller.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/string_res.dart';
import '../changePass_screen/pass_screen.dart';
import '../delivery_location/delivery_screen.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return Scaffold(
      body: GetBuilder<AccountController>(id: "Update",builder: (controller) => Padding(
        padding:
        EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenIcon(onTap:()=>Get.back() ),
            Padding(
              padding: EdgeInsets.only(
                  left: w * 0.05, top: h * 0.018, right: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(StringRes.account1),
                  vertical(height: h * 0.03),
                  InkWell(
                    onTap:controller.goToEditScreen,
                    child: commenAccountContainor(
                        image: AssetsRes.s1,
                        data: StringRes.information,
                        data1: StringRes.information1),
                  ), vertical(height: h * 0.012),
                  InkWell(  onTap: () => Get.to(const PassWordScreen()),
                    child: commenAccountContainor(
                        image: AssetsRes.password,
                        data: StringRes.passWord,
                        data1: StringRes.changePass),
                  ), vertical(height: h * 0.012),
                  commenAccountContainor(
                      image: AssetsRes.payment,
                      data: StringRes.payment,
                      data1: StringRes.payment1), vertical(height: h * 0.012),
                  InkWell( onTap: () => Get.to(const DeliveryScreen()),
                    child: commenAccountContainor(
                        image: AssetsRes.location,
                        data: StringRes.location,
                        data1: StringRes.location1),
                  )
                ],
              ),
            )
          ],
        ),
      ),),
    );
  }
}
