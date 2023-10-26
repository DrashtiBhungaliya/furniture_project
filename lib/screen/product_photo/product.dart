import 'package:flutter/material.dart';
import 'package:furniture_project/screen/cart_screen/cart_screen.dart';
import 'package:furniture_project/screen/product_photo/photo_controller.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class ProductPhotoScreen extends StatelessWidget {
  const ProductPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PhotoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding:
              EdgeInsets.only(left: w * 0.05, top: h * 0.04, right: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_outlined)),
              const Text(
                StringRes.photo,
                style: TextStyle(fontFamily: "Avenir", fontSize: 17),
              ),
              const Icon(Icons.favorite_outline)
            ],
          ),
        ),
      ),
      body: GetBuilder<PhotoController>(
        id: "Update",
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h * 0.055,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorRes.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => controller.onChanged(),
                        child:circle(
                          backgroundColor: ColorRes.darkBlue,
                          border: Border.all(
                            color: controller.index == 0
                                ? ColorRes.darkBlue
                                : ColorRes.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.onChanged1(),
                        child:circle(
                          backgroundColor:  ColorRes.blue,
                          border: Border.all(
                            color: controller.index != 1
                                ? ColorRes.white
                                :  ColorRes.blue,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.onChanged2(),
                        child:circle(
                          backgroundColor: ColorRes.brown,
                          border: Border.all(
                            color: controller.index != 2
                                ? ColorRes.white
                                :  ColorRes.brown,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.onChanged3(),
                        child: circle(
                          backgroundColor: ColorRes.imageGrey,
                          border: Border.all(
                            color: controller.index != 3
                                ? ColorRes.white
                                :  ColorRes.imageGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                horizontal(width: w * 0.02),
                Container(
                  height: h * 0.04,
                  width: w * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorRes.grey,
                  ),
                  child: const Icon(Icons.close),
                )
              ],
            ),
            vertical(height: h * 0.015),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: commenContainor(
                height: h * 0.4,
                width: w * 0.65,
                child: controller.itemImage[controller.index],
              ),
            ),
            vertical(height: h * 0.01),
            Image.asset(AssetsRes.curv),
            vertical(height: h * 0.015),
            Card(
              color: ColorRes.white,
              shadowColor: ColorRes.black.withOpacity(0.5),
              elevation: 5,
              child: Container(
                height: h * 0.2,
                padding: EdgeInsets.only(
                    right: w * 0.04, left: w * 0.04, top: h * 0.015),
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        commenText(StringRes.rChair),
                        const Spacer(),
                        const Text(
                          "(4.4)",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        const Icon(
                          Icons.star,
                          color: ColorRes.yellow,
                          size: 16,
                        ),
                      ],
                    ),
                    vertical(height: h * 0.003),
                    const Text(
                      "Living Room",
                      style: TextStyle(
                        color: ColorRes.textGrey,
                      ),
                    ),
                    vertical(height: h * 0.009),
                    const Row(
                      children: [
                        Text(
                          "\$78",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontSize: 20,
                            fontFamily: "Avenir",
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Details",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontSize: 16,
                            fontFamily: "Avenir",
                          ),
                        ),
                      ],
                    ),
                    vertical(height: h * 0.009),
                    commenButton(
                      "Add to Cart",
                      onTap: () {
                        Get.to(
                          CartScreen(shopCart: const []),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget circle({BoxBorder? border, Color? backgroundColor}) {
  return Container(
    padding: const EdgeInsets.all(2.7),
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: border,
    ),
    child: CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 13,
    ),
  );
}
