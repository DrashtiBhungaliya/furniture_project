import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import 'check_out_controller.dart';
import 'check_out_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding:  EdgeInsets.only(top: h*0.07,left: w*0.04),
             child: commenIcon(onTap:()=>Get.back() ),
           ),
          Padding(
            padding:  EdgeInsets.only(top: h*0.018,left: w*0.08),
            child: titleText(StringRes.checkOut),
          ),
          Padding(
            padding:  EdgeInsets.only(top: h*0.018,left: w*0.08,bottom: h*0.02),
            child: commenText(StringRes.shippingTo),
          ),
          addressListView2(),
          Padding(
            padding: EdgeInsets.only(top: h*0.012,left: w*0.08),
            child: commenText("Payment method"),
          ),
          addressListView1(),
          vertical(height: h*0.04),
         const Divider(color: ColorRes.grey,indent: 15,endIndent: 15,),
            totalText(),

          const Spacer(),
         commenBottom(StringRes.payText,)
        ],
      ),
    );
  }
}
