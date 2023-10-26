
import 'package:get/get.dart';

import '../../utils/assets_res.dart';

class CheckOutController extends GetxController{
  List<bool> checked = [];
  List<bool> isChecked = [];
  List<Map<String,dynamic>> address = [
    {"Image":AssetsRes.visa,
      "Title":"**** **** **** 3765",
      "SubTitle":"VISA"
    },
    {"Image":AssetsRes.payPal,
      "Title":"pfeffer_ellen@balieri.net",
      "SubTitle":"Paypal"
    },
    {"Image":AssetsRes.masterCard,
      "Title":"**** **** **** 8562",
      "SubTitle":"Master Card"
    },
  ];
  List<Map<String,dynamic>> address1 = [
    {"Image":AssetsRes.home,
      "Title":"658 Yost Island Apt",
      "SubTitle":"Seattle, US"
    },
    {"Image":AssetsRes.flag,
      "Title":"658 Yost Island Apt",
      "SubTitle":"Seattle, US"
    },
    {"Image":AssetsRes.home,
      "Title":"658 Yost Island Apt",
      "SubTitle":"Seattle, US"
    },
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
    checked= List<bool>.filled(address.length, false);
    isChecked= List<bool>.filled(address1.length, false);

  }

}