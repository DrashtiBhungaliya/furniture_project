import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../checkOut_screen/check_out_screen.dart';
import 'cart_controller.dart';

class CartScreen extends StatelessWidget {
  List<Map> shopCart = [];

  CartScreen({super.key, required this.shopCart});


  @override
  Widget build(BuildContext context) {
    Get.put(CartController(cart1: shopCart));
    return Scaffold(
      body: GetBuilder<CartController>(id: "Update",builder: (controller) =>
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: h * 0.07,
                  left: w * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commenIcon(onTap: () => Get.back()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: w * 0.05,
                        top: h * 0.018,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(StringRes.shoppingCart),
                          vertical(height: h * 0.035),
                          commenText(controller.cart1.isNotEmpty ?"${controller.cart1.length} items":""),
                          controller.cart1.isNotEmpty ? SizedBox(height: 415,
                            child: ListView.separated(
                              itemCount: controller.cart1.length,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  vertical(height: 15),
                              itemBuilder: (context, index) =>
                                  Slidable(
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        CustomSlidableAction(
                                          backgroundColor: Colors.transparent,
                                          onPressed: (context) {},
                                          child: InkWell(onTap: () =>
                                              controller.onChanged(index,context),
                                            child: CircleAvatar(radius: 30,
                                              backgroundColor: const Color(
                                                  0xffFF2D55),
                                              child: Image.asset(
                                                  AssetsRes.delete),
                                            ),
                                          ),)
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: h * 0.11,
                                                  width: w * 0.22,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    controller
                                                        .cart1[index]["image"]
                                                        .toString(),

                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            horizontal(width: w * 0.04),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                commenText(controller
                                                    .cart1[index]["Text"]
                                                    .toString(),),
                                                vertical(height: h * 0.03),
                                                Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundColor: ColorRes.black,
                                                      radius: 5,
                                                    ),
                                                    horizontal(width: w * 0.01),
                                                    const Text(
                                                      "White",
                                                      style: TextStyle(
                                                          color: ColorRes.textGrey),
                                                    ),
                                                    const SizedBox(
                                                      height: 13,
                                                      child: VerticalDivider(
                                                        color: ColorRes.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .cart1[index]["Text3"]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: ColorRes
                                                              .textGrey),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: ColorRes.grey,
                                          indent: 100,
                                          endIndent: 15,
                                        )
                                      ],
                                    ),
                                  ),
                            ),
                          ) : Padding(
                            padding:
                            EdgeInsets.only(
                                top: h * 0.0, left: w * 0.0, right: w * 0.08),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.09),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      //vertical(height: h*0.07),
                                      Image.asset(
                                        AssetsRes.cart,
                                        height: 150,
                                      ),
                                      vertical(height: h * 0.03),
                                      const Text(
                                        StringRes.empty,
                                        style: TextStyle(
                                            color: ColorRes.textGrey,
                                            fontSize: 14,
                                            fontFamily: "Regular",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      vertical(height: h * 0.02),
                                      const Text(
                                        StringRes.solution,
                                        style: TextStyle(
                                            color: ColorRes.black,
                                            fontSize: 13,
                                            fontFamily: "Regular",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      vertical(height: h * 0.05),
                                      commenButton(
                                          StringRes.goShopping, onTap: () {}),
                                      vertical(height: h * 0.1),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //vertical(height: h * 0.025),
              controller.cart1.isNotEmpty ? const Divider(
                color: ColorRes.grey, endIndent: 20, indent: 20, height: 20,
              ) : const SizedBox(),
              controller.cart1.isNotEmpty?totalText():const SizedBox(),
              const Spacer(),
              controller.cart1.isNotEmpty ? InkWell(
                onTap: () => Get.to(const CheckOutScreen(),),
                child: commenBottom(StringRes.checkOut),):const SizedBox(),
            ],
          ),),
    );
  }
}
