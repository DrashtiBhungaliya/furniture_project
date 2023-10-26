import 'package:flutter/material.dart';
import 'package:furniture_project/screen/home_screen/home_controller.dart';
import 'package:get/get.dart';
import '../../utils/color_res.dart';

class CartController extends GetxController{
HomeController homeController = Get.find<HomeController>();

  List<Map> cart1 = [];
  CartController({required this.cart1});
  void onChanged(int index,context){
    cart1.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(seconds: 1),
        content: const Text(
          "Item Removed",),
        backgroundColor: ColorRes.yellow,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
    );
    homeController.counter--;
    update(["Update"]);

  }


}