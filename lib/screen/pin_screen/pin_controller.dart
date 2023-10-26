
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PinController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
var code;
void onChange(value){
  code = value;
}

}