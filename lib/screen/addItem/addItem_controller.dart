import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  File? pickImageFile;
  String imagePath = '';
  ImagePicker imagePicker = ImagePicker();

  Future<void> imagePick() async {
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      pickImageFile = File(pickedImage.path);
      imagePath = pickedImage.path;
    }
    update(['pickImage']);
  }

  void sendData() {
    Map data = {
      "image":imagePath,
      "Text": productController.text.toString(),
      "Text2": priceController.text.toString(),
      "Text3": ratingController.text.toString(),
    };
    Get.back(result: data);
    update();
  }
}
