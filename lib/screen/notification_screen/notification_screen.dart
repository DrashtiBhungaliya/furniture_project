import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import 'notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  titleText(StringRes.noti),
                  ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(horizontalTitleGap: 10,
                          contentPadding: const EdgeInsets.only(left: 0),
                          title: Text(
                            controller.notiData[index]["Title"],
                            style: const TextStyle(
                                color: ColorRes.black,fontWeight: FontWeight.w700,
                                fontSize: 15,height: 1.2
                                //fontFamily: "Avenir"
                            ),
                          ),
                          subtitle:Text(
                            controller.notiData[index]["SubTitle"],
                            style: const TextStyle(
                                color: ColorRes.textGrey,fontWeight: FontWeight.w400,
                                fontSize: 15,height: 3

                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: ColorRes.grey,
                            child: Image.asset(controller.notiData[index]["Image"]),
                          ),
                        ),
                        const Divider(color: ColorRes.grey,indent: 90,height: 1,)
                      ],
                    ),
                    itemCount: controller.notiData.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
