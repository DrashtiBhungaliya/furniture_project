
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../cart_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../product_detail/product_screen.dart';


class BottomBarController extends GetxController{

  int index = 0;
  final List<Widget> screen = [
     HomeScreen(cart:[],),
    const ProductScreen(),
    CartScreen(shopCart: const []),
    NotificationScreen(),
    const SizedBox()
  ];
  void home(){
    index = 0;
    update(["Bottom"]);
  }
  void direc(){
    index = 1;
    update(["Bottom"]);
  }
  void bag(){
    index = 2;
    update(["Bottom"]);
  }
  void notification(){
    index = 3;
    update(["Bottom"]);
  }
  void profile(){
    index = 4;
    update(["Bottom"]);
  }

}