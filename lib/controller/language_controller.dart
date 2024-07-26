import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/controller/news_controller.dart';
import 'package:football_score/utils/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final language = ''.obs;
  final matchController = Get.put(MatchController());
  final newsController = Get.put(NewsController());
  final isLoading = false.obs;
  @override
  void onInit() {
    getLanguage();
    super.onInit();
  }

  void changeLanguage(String languageCode, String countryCode) {
    isLoading.value = true;
    language.value = languageCode;
    Global.language = languageCode;
    Get.updateLocale(Locale(languageCode, countryCode));
    final box = GetStorage();
    box.write('language', languageCode);

    Get.find<AppConfigController>().getAppConfig('language');
    Future.delayed(const Duration(seconds: 2), () {
      matchController.startMatch();
      newsController.startNew();
      isLoading.value = false;
    });
  }

  void getLanguage() {
    final box = GetStorage();
    language.value = box.read('language') ?? 'en';
  }
}
