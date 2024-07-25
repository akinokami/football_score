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
  RxList<Articles> searchArticleList = <Articles>[].obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    startNew();
    super.onInit();
  }

  void searchNews() {
    if (searchController.text.isNotEmpty) {
      searchArticleList.value = articleList
          .where((element) => element.title!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  void startNew() {
    if (Get.find<AppConfigController>().mTabList.isNotEmpty) {
      getNews(Get.find<AppConfigController>().newsTabList[0].api ?? '');
    }

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
      if (newsModel.value.articles?.isNotEmpty ?? true) {
        articleList.value =
            result.articles?.where((element) => element.thumb != "").toList() ??
                [];
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
