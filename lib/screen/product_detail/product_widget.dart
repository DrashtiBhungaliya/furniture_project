import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_project/screen/product_detail/product_controller.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';


import '../filter_screen/filter_screen.dart';
import '../product_photo/product.dart';

AppBar productAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    flexibleSpace: Padding(
      padding: EdgeInsets.only(left: w * 0.05, top: h * 0.04, right: w * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_outlined)),
          const Text(
            StringRes.productDetails,
            style: TextStyle(fontFamily: "Avenir", fontSize: 17),
          ),
          Container(
            height: h * 0.04,
            width: w * 0.08,
            decoration: BoxDecoration(
              color: ColorRes.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.share,
              color: ColorRes.yellow,
              size: 20,
            ),
          )
        ],
      ),
    ),
  );
}

Widget detailContainor() {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: commenContainor(
          width: w * 0.67,
          height: h * 0.38,
          child: Image.asset(
            Get.arguments["image"],
            fit: BoxFit.fill,
          ),
        ),
      ),
      horizontal(width: w * 0.026),
      Column(
        children: [
          commenContainor(
              height: h * 0.12,
              width: w * 0.21,
              child: Column(
                children: [
                  vertical(height: h * 0.02),
                  Image.asset(
                    AssetsRes.a1,
                    height: 11,
                  ),
                  vertical(height: h * 0.025),
                  const Text(
                    StringRes.width,
                    style: TextStyle(fontSize: 12),
                  ),
                  vertical(height: h * 0.005),
                  const Text(
                    StringRes.cm,
                    style: TextStyle(fontSize: 14, color: ColorRes.yellow),
                  ),
                ],
              )),
          vertical(height: h * 0.01),
          commenContainor(
              height: h * 0.12,
              width: w * 0.21,
              child: Column(
                children: [
                  vertical(height: h * 0.015),
                  Image.asset(
                    AssetsRes.a2,
                    height: 20,
                  ),
                  vertical(height: h * 0.015),
                  const Text(
                    StringRes.height,
                    style: TextStyle(fontSize: 12),
                  ),
                  vertical(height: h * 0.005),
                  const Text(
                    StringRes.cm1,
                    style: TextStyle(fontSize: 14, color: ColorRes.yellow),
                  ),
                ],
              )),
          vertical(height: h * 0.01),
          commenContainor(
              height: h * 0.12,
              width: w * 0.21,
              child: Column(
                children: [
                  vertical(height: h * 0.015),
                  Image.asset(
                    AssetsRes.a3,
                    height: 20,
                  ),
                  vertical(height: h * 0.015),
                  const Text(
                    StringRes.material,
                    style: TextStyle(fontSize: 12),
                  ),
                  vertical(height: h * 0.005),
                  const Text(
                    StringRes.wooden,
                    style: TextStyle(fontSize: 14, color: ColorRes.yellow),
                  ),
                ],
              ))
        ],
      )
    ],
  );
}

Widget productName() {
  return commenContainor(
      height: h * 0.1,
      width: w,
      child: Padding(
        padding: EdgeInsets.only(left: w * 0.045, right: w * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vertical(height: h * 0.012),
            Row(
              children: [
                Text(
                  Get.arguments["text"],
                  style: const TextStyle(fontFamily: "Avenir", fontSize: 15),
                ),
                const Spacer(),
                Text(
                  Get.arguments["text1"],
                  style: const TextStyle(fontFamily: "Avenir", fontSize: 18),
                ),
              ],
            ),
            vertical(height: h * 0.016),
            const Text(
              "Living Room",
              style: TextStyle(
                  fontFamily: "Avenir", fontSize: 13, color: ColorRes.grey),
            ),
          ],
        ),
      ));
}

Widget color() {
  return InkWell(
    onTap: () => Get.to(const FilterScreen()),
    child: commenContainor(
        height: h * 0.125,
        width: w,
        child: Padding(
          padding: EdgeInsets.only(
              left: w * 0.045, right: w * 0.045, top: h * 0.012),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringRes.color,
                style: TextStyle(fontFamily: "Avenir", fontSize: 15),
              ),
              vertical(height: h * 0.02),
              Row(
                children: [
                  Image.asset(
                    AssetsRes.co1,
                    height: 40,
                  ),
                  horizontal(width: w * 0.03),
                  Image.asset(
                    AssetsRes.co2,
                    height: 40,
                  ),
                  horizontal(width: w * 0.03),
                  Image.asset(
                    AssetsRes.co3,
                    height: 40,
                  ),
                  horizontal(width: w * 0.03),
                  Image.asset(
                    AssetsRes.co4,
                    height: 40,
                  ),
                  horizontal(width: w * 0.03),
                  Image.asset(
                    AssetsRes.co5,
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        )),
  );
}

Widget description() {
  return commenContainor(
      height: h * 0.15,
      width: w,
      child: Padding(
        padding:
            EdgeInsets.only(left: w * 0.045, right: w * 0.045, top: h * 0.012),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringRes.description,
              style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 15,
              ),
            ),
            vertical(height: h * 0.012),
            const Text(
              StringRes.descriptionText,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ));
}

Widget categories() {
  return commenContainor(
      height: h * 0.127,
      width: w,
      child: Padding(
        padding:
            EdgeInsets.only(left: w * 0.045, right: w * 0.0, top: h * 0.016),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  StringRes.sku,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 13, fontFamily: "Avenir"),
                ),
                horizontal(width: w * 0.295),
                const Text(StringRes.no,
                    style: TextStyle(
                      color: ColorRes.black,
                      fontSize: 13,
                    )),
              ],
            ),
            Row(
              children: [
                const Text(
                  StringRes.categories,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 13, fontFamily: "Avenir"),
                ),
                horizontal(width: w * 0.17),
                const Text(StringRes.accessories,
                    style: TextStyle(
                      color: ColorRes.black,
                      fontSize: 13,
                    )),
              ],
            ),
            Row(
              children: [
                const Text(
                  StringRes.tags,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 13, fontFamily: "Avenir"),
                ),
                horizontal(width: w * 0.28),
                const Text(
                  StringRes.table,
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  StringRes.dimensions,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 13, fontFamily: "Avenir"),
                ),
                horizontal(width: w * 0.15),
                const Text(
                  StringRes.size,
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}

Widget text() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.arrow_right),
          Text(
            StringRes.care,
            style: TextStyle(fontSize: 15, fontFamily: "Avenir"),
          ),
        ],
      ),
      Row(
        children: [
          Icon(Icons.arrow_right),
          Text(
            StringRes.shipping,
            style: TextStyle(fontSize: 15, fontFamily: "Avenir"),
          ),
        ],
      )
    ],
  );
}

Widget rating() {
  return commenContainor(
    height: h * 0.27,
    width: w,
    child: Padding(
      padding:
          EdgeInsets.only(left: w * 0.045, right: w * 0.04, top: h * 0.016),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                StringRes.reviews,
                style: TextStyle(fontSize: 15, fontFamily: "Avenir"),
              ),
              Spacer(),
              Text(
                StringRes.number,
                style: TextStyle(fontSize: 15, fontFamily: "Avenir"),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          Row(
            children: [
              horizontal(width: w * 0.65),
              const Text(
                StringRes.reviews,
                style: TextStyle(fontSize: 12, fontFamily: "Avenir", height: 1),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  height: h * 0.085,
                  width: w * 0.2,
                  decoration: BoxDecoration(
                    color: ColorRes.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4.8",
                            style: TextStyle(
                                fontSize: w * 0.05,
                                fontFamily: "Avenir",
                                color: ColorRes.white),
                          ),
                         const Text(
                            "out of 5",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                color: ColorRes.white),
                          ),
                        ],
                      ),
                    ],
                  )),
              horizontal(width: w * 0.025),
              SizedBox(
                  width: w * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ratingText("Excellent"),
                           const Spacer(),
                          ratingBar(percent: 0.8)
                        ],
                      ),
                      Row(
                        children: [
                          ratingText("Very Good"),
                          const Spacer(),
                          ratingBar(percent: 0.6)
                        ],
                      ),
                      Row(
                        children: [
                          ratingText("Average"),
                          const Spacer(),
                          ratingBar(percent: 0.3)
                        ],
                      ),
                      Row(
                        children: [
                          ratingText("Poor"),
                          const Spacer(),
                          ratingBar(percent: 0.15)
                        ],
                      )
                    ],
                  )),
            ],
          ),
          vertical(height: h * 0.01),
          Padding(
            padding: EdgeInsets.only(left: w * 0.01, top: h * 0.005),
            child: RatingBar.builder(unratedColor: ColorRes.black,
              initialRating: 0,itemSize: w*0.035,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal:w*0.0),
              itemBuilder: (context, _) =>const Icon(
                Icons.star,
                color: ColorRes.yellow,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          vertical(height: h * 0.022),
          const Text(
            "Add a \ncomment",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Avenir",
                color: ColorRes.yellow,
                height: 1.1),
          ),
        ],
      ),
    ),
  );
}

Widget ratingBar({double percent = 0.0}) {
  return LinearPercentIndicator(
    width: w * 0.43,
    lineHeight: h * 0.007,
    backgroundColor: ColorRes.grey,
    barRadius: const Radius.circular(10),
    percent:percent,
    progressColor: ColorRes.yellow,
  );
}

Widget listViewItem() {
  return SizedBox(
    height: h * 0.26,
    child: ListView.separated(
      separatorBuilder: (context, index) => horizontal(width: 20),
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
        width: w * 0.43,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsRes.t1),
            Padding(
              padding: EdgeInsets.only(left: w * 0.02, top: h * 0.01),
              child: const Text(
                StringRes.minimalClock,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Avenir",
                  color: ColorRes.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: w * 0.02,
              ),
              child: const Row(
                children: [
                  Text(
                    "\$29",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Avenir",
                      color: ColorRes.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: ColorRes.yellow,
                    size: 15,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Avenir",
                      color: ColorRes.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget addToCart() {
  return GetBuilder<ProductController>(
    id: "Update",
    builder: (controller) => Row(
      children: [
        commenContainor(
          height: h * 0.05,
          width: w * 0.253,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.007),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => controller.removeToCart(),
                  child: Container(
                    height: h * 0.035,
                    width: w * 0.07,
                    decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  ),
                ),
                Text(controller.counter.toString()),
                InkWell(
                  onTap: () => controller.addToCart(),
                  child: Container(
                    height: h * 0.035,
                    width: w * 0.07,
                    decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        horizontal(width: w * 0.06),
        InkWell(
          onTap: () => Get.to(const ProductPhotoScreen(), arguments: {
            "SImage": Get.arguments["Image"],
          }),
          child: Container(
            height: h * 0.05,
            width: w * 0.59,
            decoration: BoxDecoration(
              color: ColorRes.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
                child: Text(
              "Add to Cart",
              style: TextStyle(
                  color: ColorRes.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )),
          ),
        )
      ],
    ),
  );
}


Widget ratingText(String data) {
  return Text(
    data,
    style: const TextStyle(
        color: ColorRes.textGrey, fontSize: 12, fontFamily: "Regular"),
  );
}
