import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/screen/delivery_location/delivery_screen.dart';
import 'package:furniture_project/screen/home_screen/home_screen.dart';
import 'package:furniture_project/screen/product_photo/product.dart';
import 'package:furniture_project/screen/setting_screen/lan_controller.dart';
import 'package:furniture_project/screen/setting_screen/setting_screen.dart';
import 'package:furniture_project/utils/firebase_services.dart';
import 'package:furniture_project/utils/pref_services.dart';

import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await PreferenceService.inIt();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBFWuoKgvE_YS07SSB-3UiZ1SbyAzsjabk',
      appId: '1:344297614997:android:67b0636ac637fb7b78f59c',
      messagingSenderId: '344297614997',
      projectId: 'project-7ccf3',
      storageBucket: "project-7ccf3.appspot.com",
      databaseURL: "https://project-7ccf3-default-rtdb.firebaseio.com"
    ),
  );
  FireBaseServices.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      translations: Langauage(),
      locale: Get.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: DeliveryScreen(),
    );
  }
}
