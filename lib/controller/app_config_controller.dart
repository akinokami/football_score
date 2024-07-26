import 'package:flutter/material.dart';
import 'package:football_score/views/screens/home._menu.dart';
import 'package:football_score/views/screens/intro/intro_screen.dart';
import 'package:football_score/views/screens/no_internet_widget.dart';
import 'package:football_score/views/screens/wrong_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/app_model.dart';
import '../services/api_repo.dart';
import '../utils/constants.dart';

class AppConfigController extends GetxController {
  final isLoading = false.obs;
  Rx<AppModel> appModel = AppModel().obs;
  RxList<MatchTab> mTabList = <MatchTab>[].obs;
  RxList<News> newsTabList = <News>[].obs;

  String first = '';

  @override
  void onInit() {
    getAppConfig('');

    super.onInit();
  }

  Future<void> getAppConfig(String? fromPage) async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getAppConfig();
      appModel.value = result;
      mTabList.value = appModel.value.menus?.matchTab
              ?.where((element) =>
                  element.id != 50003 &&
                  element.id != 18 &&
                  element.id != 262 &&
                  element.id != 4 &&
                  element.id != 3 &&
                  element.id != 5)
              .toList() ??
          [];

      newsTabList.value = appModel.value.menus?.news
              ?.where((element) =>
                  element.id != "1" &&
                  element.id != "208" &&
                  element.id != "106" &&
                  element.id != "4" &&
                  element.id != "13" &&
                  element.id != "5" &&
                  element.id != "6" &&
                  element.id != "113" &&
                  element.id != "114" &&
                  element.id != "14" &&
                  element.id != "99")
              .toList() ??
          [];
      if (fromPage != 'language') {
        final box = GetStorage();
        first = box.read('first') ?? '';

        // Future.delayed(const Duration(seconds: 3), () {
        (first == '')
            ? Get.offAll(() => const IntroScreen())
            : Get.offAll(() => HomeMenu());
        // });
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      if (e.toString() == "No internet connection !") {
        Get.offAll(() => const NoInternetWidget());
      } else {
        Get.offAll(() => const WrongWidget());
      }
      // constants.showSnackBar(
      //     title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
