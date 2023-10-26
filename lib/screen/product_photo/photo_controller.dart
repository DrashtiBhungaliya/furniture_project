import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/assets_res.dart';

class PhotoController extends GetxController{
  int index  = 0;
  void onChanged(){
    index = 0;
    update(["Update"]);
  }
  void onChanged1(){
    index = 1;
    update(["Update"]);
  }
  void onChanged2(){
    index = 2;
    update(["Update"]);
  }
  void onChanged3(){
    index = 3;
    update(["Update"]);
  }


var itemImage = [
  Image.asset(AssetsRes.darkBlueChair,fit: BoxFit.fill),
  Image.asset(AssetsRes.c2,fit: BoxFit.fill,),
  Image.asset(AssetsRes.brownChair,fit: BoxFit.fill),
  Image.asset(AssetsRes.greyChair,fit: BoxFit.fill),
];
}
