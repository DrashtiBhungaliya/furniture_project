import 'package:flutter/material.dart';
import 'package:furniture_project/screen/addItem/addItem_screen.dart';

import 'package:furniture_project/screen/fav_screen/fav_controller.dart';

import 'package:get/get.dart';

import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../fav_screen/fav_screen.dart';

class HomeController extends GetxController {
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update(["Update"]);
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FavController favController = Get.put(FavController());
  int counter = 0;
  int index = 0;
  List<Map> addCart = [];
  List<Map> addItem = [];
  void onTap() {
    Get.to(() => AddItemScreen())!.then(
          (value) {
        if (value != null) {
          addItem.add(value);
        }
        update(["Update"]);
      },
    );
  }
  HomeController({required this.addCart,});


  List<Map> chairList = [{
    "image": AssetsRes.c1,
    "Text": "Dulax Estra",
    "Text2": "4.8",
    "Text3": "\$48"
  },
    {
      "image": AssetsRes.c2,
      "Text": "Redanka Chair",
      "Text2": "4.4",
      "Text3": "\$78"
    },
    {
      "image": AssetsRes.c3,
      "Text": "Istamo Chair",
      "Text2": "4.8",
      "Text3": "\$88"
    },
    {
      "image": AssetsRes.c4,
      "Text": "Lensana Chair",
      "Text2": "4.8",
      "Text3": "\$73"
    },
  ];

  void onTap2(int index, context) {
    addCart.add(chairList[index]);
    print(chairList[index]);
    counter++;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:const Text(
            "Item Added",
          ),
          backgroundColor: ColorRes.yellow,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
    );
    update(["Update"]);
  }
  void onNav(){
    Get.to(()=>FavScreen());
    update(["Update"]);
  }
void onClose(){
 scaffoldKey.currentState!.closeDrawer();
  update(["Update"]);
}  void  onTapLike(Map data){
    favController.onTapLikeButton(data);
  }
  bool isLike(int index){
    return favController.favoritesList.any((element) => element["image"]==chairList[index]["image"]);
  }

}
