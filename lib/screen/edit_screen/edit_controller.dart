import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_project/utils/firebase_services.dart';
import 'package:get/get.dart';

import '../../utils/pref_services.dart';

class EditController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String loginUserId = '';
  Map? editUser;
  DatabaseReference databaseReference =
      FireBaseServices.firebaseDatabase!.ref('Drashti');

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    loginUserId = PreferenceService.getString('loginUserId');
    editUser = await FireBaseServices.getData(
      databaseReference.child(loginUserId),
    );
    nameController.text = editUser!["name"];
    emailController.text = editUser!["email"];
    update(["Update"]);
  }

  Future<void> updateProfile() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('Drashti').child(loginUserId);

    Map<String, dynamic> editData = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
    };
    await FireBaseServices.updateData(databaseReference, editData);
    Get.back(result: editData);
    Get.snackbar("Edit Successfully", "Thank You");
  }
}
