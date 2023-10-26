import 'package:flutter/material.dart';
import 'package:furniture_project/screen/fav_screen/fav_controller.dart';
import 'package:get/get.dart';
import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';

class FavScreen extends StatelessWidget {
  FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavController());
    return Scaffold(
      body: GetBuilder<FavController>(
          builder: (controller) => Padding(
                padding: EdgeInsets.only(
                    top: h * 0.07, left: w * 0.04, right: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commenIcon(onTap: () => Get.back()),
                    Padding(
                      padding: EdgeInsets.only(
                          left: w * 0.05, top: h * 0.0, right: w * 0.00),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          titleText("Favorite"),
                          controller.favoritesList.isNotEmpty? ListView.builder(shrinkWrap: true,
                            itemCount: controller.favoritesList.length,
                            itemBuilder: (context, index) => Container(
                              height: h * 0.18,
                              width: w * 0.8,
                              decoration: BoxDecoration(
                                color: ColorRes.lightGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: h * 0.5,
                                    width: w * 0.4,
                                    child: Image.asset(
                                        controller.favoritesList[index]["image"].toString(),
                                        fit: BoxFit.fill),
                                  ),
                                  horizontal(width: w * 0.04),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      vertical(height: h * 0.03),
                                      Text(
                                        controller.favoritesList[index]["Text"],
                                        style:
                                        const TextStyle(fontFamily: "Avenir", fontSize: 17),
                                      ),
                                      vertical(height: h * 0.02),
                                      Row(
                                        children: [
                                          Text(
                                            controller.favoritesList[index]["Text3"],
                                            style: const TextStyle(
                                                fontFamily: "Avenir", fontSize: 18),
                                          ),
                                          horizontal(width: w * 0.15),
                                          const Icon(
                                            Icons.star,
                                            color: ColorRes.yellow,
                                            size: 15,
                                          ),
                                          Text(
                                            controller.favoritesList[index]["Text2"],
                                            style: const TextStyle(
                                                fontFamily: "Avenir", fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      vertical(height: h * 0.01),
                                      Padding(
                                        padding: EdgeInsets.only(left: w * 0.15),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: h * 0.04,
                                              width: w * 0.08,
                                              decoration: BoxDecoration(
                                                  color: ColorRes.yellow,
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: InkWell(
                                                onTap: () {},
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
                                              child: InkWell(
                                                onTap: () => controller.onRemove(index),
                                                child: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                  size: 20,
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
                          ):
                           Padding(
                           padding:  EdgeInsets.symmetric(vertical: h*0.35),
                           child:const  Center(
                              child: Text(
                                "Your Favorite List is empty",
                                style: TextStyle(
                                    color: ColorRes.textGrey,
                                    fontFamily: "Regular"),
                              ),
                            ),
                         ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
