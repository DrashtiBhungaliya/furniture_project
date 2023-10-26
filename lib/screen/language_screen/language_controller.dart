import 'package:get/get.dart';

class LanguageController extends GetxController{
   List<bool> checked = [];
   List<bool> isChecked = [];

  List<String> country = [
  "English(US)",
  "English(UK)",
];
   List<String> language = [
     "Mandarin",
     "Hindi",
     "Spanish",
     "French",
     "Arabic",
     "Bengali",
     "Indonesia",
   ];

void selectValue(value,int index){
  checked[index] = value;
  update();
}

void selectValue1(value,int index){
     isChecked[index] = value;
     update();
   }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checked= List<bool>.filled(country.length, false);
    isChecked= List<bool>.filled(language.length, false);
  }
}