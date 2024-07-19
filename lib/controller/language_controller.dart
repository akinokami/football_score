import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/controller/news_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final language = ''.obs;

  @override
  void onInit() {
    getLanguage();
    super.onInit();
  }

  void changeLanguage(String languageCode, String countryCode) {
    language.value = languageCode;
    Get.updateLocale(Locale(languageCode, countryCode));
    final box = GetStorage();
    box.write('language', languageCode);
    Get.find<AppConfigController>().getAppConfig();
    Get.find<MatchController>().startMatch();
    Get.find<NewsController>().startNew();
  }

  void getLanguage() {
    final box = GetStorage();
    language.value = box.read('language') ?? 'en';
  }
}
