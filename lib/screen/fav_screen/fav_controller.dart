
import 'package:get/get.dart';

class FavController extends GetxController{
  List favoritesList  = [];

  void onTapLikeButton(Map data){
    int index = favoritesList.indexWhere((element) => element["image"]==data["image"]);
    if(index!=-1){
      favoritesList.removeAt(index);
    }else{
      favoritesList.add(data);
    }
    update();
  }

  void favToFamousBack(){
    Get.back();
  }
void onRemove(int index){
    favoritesList.removeAt(index);
    update();

}
}