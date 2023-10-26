import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxBool light = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTheme();
    getLang();
  }

  saveTheme() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', light.value);
  }

  getTheme() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    light.value = await isLight.value;
    Get.changeThemeMode(light.value ? ThemeMode.light : ThemeMode.dark);
  }

  void onChanged(val) {
    light.value = val;
    Get.changeThemeMode(
      light.value ? ThemeMode.light : ThemeMode.dark,
    );
    saveTheme();
  }
  RxBool lang = false.obs;
  saveLangauage() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('Lan', lang.value);
  }
  getLang() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('Lan') ?? true;
    }).obs;
    lang.value = await isLight.value;

    Get.updateLocale(lang.value?const Locale("ar"):const Locale("en"));
  }
  void onChangedLan(val) {
    lang.value = val;
    Get.updateLocale(lang.value?const Locale("ar"):const Locale("en"),);
    saveLangauage();
  }

}
