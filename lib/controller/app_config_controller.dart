import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/app_model.dart';
import '../services/api_repo.dart';
import '../utils/constants.dart';

class AppConfigController extends GetxController {
  final isLoading = false.obs;
  Rx<AppModel> appModel = AppModel().obs;
  RxList<MatchTab> mTabList = <MatchTab>[].obs;
  RxList<News> newsTabList = <News>[].obs;

  @override
  void onInit() {
    getAppConfig();
    super.onInit();
  }

  Future<void> getAppConfig() async {
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
      print("asfdfdffdf");
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
