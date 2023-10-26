

import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController{
  SfRangeValues changeValue = const SfRangeValues(200.0, 800.0);
  void onChange(dynamic value){
    changeValue = value;
    update();
  }
}