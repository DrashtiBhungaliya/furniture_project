import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_project/commen/commen_widget.dart';
import 'package:furniture_project/screen/addItem/addItem_controller.dart';
import 'package:get/get.dart';

import '../../utils/color_res.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemController());
    return Scaffold(resizeToAvoidBottomInset: false,
      body: GetBuilder<AddItemController>(
        id: "pickImage",
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              vertical(height: h*0.1),
              Stack(
                children: [

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 110),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: ColorRes.yellow,
                      backgroundImage:  FileImage(File(controller.imagePath))
                    ),
                  ),
                  Positioned(top: 60,left: w*0.55,
                    child: InkWell(
                        onTap: () {
                          controller.imagePick();
                        },
                        child: Icon(Icons.camera_alt)),
                  ),
                ],
              ),
              vertical(height:h*0.1 ),
              textField(
                  controller: controller.productController,
                  hintText: "ProductName"),
              textField(
                  controller: controller.priceController,
                  hintText: "ProductPrice"),
              textField(
                  controller: controller.ratingController,
                  hintText: "ProductRating"),
              vertical(height: h*0.1),
              ElevatedButton(onPressed: () => controller.sendData(), child: Text("Back"),style:ElevatedButton.styleFrom(backgroundColor: ColorRes.yellow) )
            ],
          ),
        ),
      ),
    );
  }
}
