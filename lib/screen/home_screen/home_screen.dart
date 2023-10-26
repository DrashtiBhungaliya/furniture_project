import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import 'home_controller.dart';

import 'home_widget.dart';


class HomeScreen extends StatefulWidget {
  List<Map> cart = [];
   HomeScreen({super.key,required this.cart,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController controller =  Get.put(HomeController(addCart: widget.cart, ));
    return Scaffold(
    key: controller.scaffoldKey,
      appBar: appbar(),
      floatingActionButton: floatingButton(),
      drawer:openDrawer(),
      body: DefaultTabController(length: 4,
        child: Padding(
          padding:  EdgeInsets.only(left: w*0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tabBar(),
              vertical(height: h*0.03),
              text(),
              vertical(height: h*0.02),
              Expanded(child: tabBarView(),),
              vertical(height: h*0.0)
            ],
          ),
        ),
      ),
    );
  }
}
