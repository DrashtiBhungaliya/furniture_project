import 'package:get/get.dart';

class ProductController extends GetxController{
  int counter=0;
  void addToCart(){
    if(counter>=0){
      counter++;
      update(["Update"]);
    }
    update(["Update"]);
  }
  void removeToCart(){
    if(counter>0){
      counter--;
      update(["Update"]);
    }

  }
}