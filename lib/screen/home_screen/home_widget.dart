import 'dart:io';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/screen/cart_screen/cart_screen.dart';
import 'package:furniture_project/screen/product_detail/product_screen.dart';
import 'package:get/get.dart';
import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../notification_screen/notification_screen.dart';
import '../search_screen/search_screen.dart';
import '../setting_screen/setting_screen.dart';
import 'home_controller.dart';

Widget floatingButton() {
  return GetBuilder<HomeController>(
    builder: (controller) => FloatingActionButton(
      onPressed: () {
        controller.onTap();
      },
      backgroundColor: ColorRes.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.add),
    ),
  );
}

AppBar appbar() {
  return AppBar(
    backgroundColor: ColorRes.white,
    automaticallyImplyLeading: false,
    elevation: 0,
    flexibleSpace: GetBuilder<HomeController>(
      id: "Update",
      builder: (controller) => Padding(
        padding:
            EdgeInsets.only(left: w * 0.05, top: h * 0.04, right: w * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => controller.scaffoldKey.currentState!.openDrawer(),
              child: Image.asset(
                AssetsRes.dase,
                height: 20,
              ),
            ),
            const Text(
              StringRes.home,
              style: TextStyle(fontFamily: "Avenir", fontSize: 20),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () => Get.to(() => CartScreen(
                        shopCart: controller.addCart,
                      )),
                  child: const Icon(Icons.shopping_cart),
                ),
                Positioned(
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: ColorRes.black,
                    child: Center(
                        child: Text(
                      controller.counter.toString(),
                      style: const TextStyle(color: ColorRes.white, fontSize: 10),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget tabBar() {
  return ButtonsTabBar(
    contentPadding: EdgeInsets.symmetric(horizontal: w * 0.04),
    buttonMargin: const EdgeInsets.only(right: 15),
    height: 35,
    labelStyle: const TextStyle(
        color: Colors.white, fontFamily: "Avenir", fontSize: 16),
    unselectedLabelStyle: const TextStyle(
        color: Colors.black, fontFamily: "Avenir", fontSize: 16),
    decoration: BoxDecoration(
      color: ColorRes.yellow,
      borderRadius: BorderRadius.circular(40),
    ),
    unselectedDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: ColorRes.grey),
    tabs: [
      const Tab(
        text: StringRes.all,
      ),
      Tab(
        icon: Image.asset(
          AssetsRes.chair,
          color: Colors.brown,
          height: 23,
        ),
        text: StringRes.chair,
      ),
      Tab(
        icon: Image.asset(
          AssetsRes.sofa,
          height: 23,
        ),
        text: StringRes.sofa,
      ),
      Tab(
        icon: Image.asset(
          AssetsRes.lamp,
          height: 23,
        ),
        text: StringRes.lamp,
      ),
    ],
  );
}

Widget tabBarView() {
  return TabBarView(children: [listView(), listView(), listView(), listView()]);
}

Widget listView() {
  return GetBuilder<HomeController>(
    id: "Update",
    builder: (controller) => ListView.separated(
      itemCount: controller.addItem.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => vertical(height: h * 0.02),
      padding: EdgeInsets.only(right: w * 0.04),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Get.to(const ProductScreen(), arguments: {
            "image": controller.chairList[index]["image"].toString(),
            "text": controller.chairList[index]["Text"],
            "text1": controller.chairList[index]["Text2"],
          });
        },
        child: Card(
          child: Container(
            height: h * 0.18,
            width: w * 0.8,
            decoration: BoxDecoration(
              color: ColorRes.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                    height: h * 0.5,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(
                                File(controller.addItem[index]["image"]))))),
                horizontal(width: w * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vertical(height: h * 0.03),
                    Text(
                      controller.addItem[index]["Text"].toString(),
                      style:
                          const TextStyle(fontFamily: "Avenir", fontSize: 20),
                    ),
                    vertical(height: h * 0.02),
                    Row(
                      children: [
                        Text(
                          controller.addItem[index]["Text2"].toString(),
                          style: const TextStyle(
                              fontFamily: "Avenir", fontSize: 18),
                        ),
                        horizontal(width: w * 0.22),
                        const Icon(
                          Icons.star,
                          color: ColorRes.yellow,
                          size: 15,
                        ),
                        Text(
                          controller.addItem[index]["Text3"].toString(),
                          style: const TextStyle(
                              fontFamily: "Avenir", fontSize: 12),
                        ),
                      ],
                    ),
                    vertical(height: h * 0.01),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.23),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => controller.onTap2(index, context),
                            child: Container(
                              height: h * 0.04,
                              width: w * 0.08,
                              decoration: BoxDecoration(
                                color: ColorRes.yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          horizontal(width: w * 0.02),
                          Container(
                            height: h * 0.04,
                            width: w * 0.08,
                            decoration: BoxDecoration(
                                color: ColorRes.yellow,
                                borderRadius: BorderRadius.circular(10)),
                            child: StatefulBuilder(
                              builder: (context, setState) => InkWell(
                                onTap: () {
                                  setState(() {
                                    controller
                                        .onTapLike(controller.chairList[index]);
                                  });
                                },
                                child: controller.isLike(index)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget text() {
  return const Text(
    StringRes.recommended,
    style: TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 16),
  );
}

Widget openDrawer() {
  return GetBuilder<HomeController>(id: "Update",
    builder: (controller) => Drawer(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.only(top: h * 0.1, left: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commenIcon(
                onTap: ()=>controller.onClose()),

            vertical(height: h * 0.05),
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(AssetsRes.person),
                ),
                horizontal(width: w * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commenText(StringRes.personName),
                    vertical(height: h * 0.01),
                    const Text(
                      StringRes.personEmail,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                horizontal(width: w * 0.06),
                Container(
                  padding: const EdgeInsets.all(6.5),
                  height: h * 0.04,
                  width: w * 0.08,
                  decoration: BoxDecoration(
                      color: ColorRes.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    AssetsRes.logOut,
                  ),
                ),
              ],
            ),
            vertical(height: h * 0.1),
            Row(
              children: [
                Image.asset(
                  AssetsRes.home,
                  height: 23,
                ),
                horizontal(width: w * 0.035),
                commenText(StringRes.home)
              ],
            ),
            vertical(height: h * 0.045),
            Row(
              children: [
                Image.asset(
                  AssetsRes.collection,
                  height: 18,
                ),
                horizontal(width: w * 0.03),
                commenText(StringRes.collection)
              ],
            ),
            vertical(height: h * 0.045),
            InkWell( onTap: () => Get.to(NotificationScreen()),
              child: Row(
                children: [
                  Image.asset(
                    AssetsRes.notification,
                    height: 23,
                  ),
                  horizontal(width: w * 0.04),
                  commenText(StringRes.noti),
                ],
              ),
            ),
            vertical(height: h * 0.045),
            InkWell( onTap: () => Get.to(const SettingScreen()),
              child: Row(
                children: [
                  Image.asset(
                    AssetsRes.setting,
                    height: 23,
                  ),
                  horizontal(width: w * 0.035),
                  commenText(StringRes.setting)
                ],
              ),
            ),
            vertical(height: h * 0.045),
            InkWell(   onTap: ()=>controller.onNav(),
              child: Row(
                children: [
                  const Icon(Icons.favorite),
                  horizontal(width: w * 0.035),
                  commenText("Favorite")
                ],
              ),
            ),
            vertical(height: h * 0.045),
            InkWell(   onTap: ()=>Get.to(const SearchScreen()),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded),
                  horizontal(width: w * 0.035),
                  commenText(StringRes.search)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
