import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../home_screen/home_screen.dart';
import 'done_controller.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoneController());
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: h * 0.07, left: w * 0.04, right: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenIcon(
              onTap:()=>Get.back(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: w * 0.04, top: h * 0.12, right: w * 0.04),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:const EdgeInsets.all(30),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: ColorRes.black, width: 5),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      AssetsRes.tick,
                    ),
                  ),
                  vertical(height:h *0.07),
                  commenText("Thank You!"),
                  vertical(height:h *0.02),
                 const Text(textAlign: TextAlign.center,
                    "Your order #76281 is completed. Please\ncheck the delivery status at Order Tracking\npage",
                    style: TextStyle(fontSize: 13,
                        color: ColorRes.black,
                        fontFamily: "Regular",
                        fontWeight: FontWeight.w500),
                  ),
                  vertical(height:h *0.08),
                  InkWell(onTap: () => Get.to(()=>HomeScreen(cart: const [],)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: w*0.09),
                      child: commenButton("Done"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
