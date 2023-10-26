import 'package:get/get.dart';

import '../edit_screen/edit_screen.dart';

class AccountController extends GetxController{
  Map? loginUser = {};
  void goToEditScreen() {
    Get.to(() => EditScreen())!.then(
          (value) {
        if (value != null) {
          loginUser = value;
        }
        update(['Update']);
      },
    );
  }

}