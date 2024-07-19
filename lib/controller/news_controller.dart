import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';

import '../models/news_model.dart';

class NewsController extends GetxController {
  final selectedIndex = 0.obs;

  final isLoading = false.obs;
  Rx<NewsModel> newsModel = NewsModel().obs;

  RxList<Articles> articleList = <Articles>[].obs;

  @override
  void onInit() {
    startNew();
    super.onInit();
  }

  void startNew() {
    getNews(
        Get.find<AppConfigController>().appModel.value.menus?.news?[0].api ??
            '');
    selectedIndex.value = 0;
  }

  void changeIndex(int index, String url) {
    selectedIndex.value = index;
    getNews(url);
  }

  Future<void> getNews(String url) async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getNews(url: url);
      newsModel.value = result;
      articleList.value = result.articles ?? [];
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
