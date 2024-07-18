import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';

import '../models/app_model.dart';
import '../models/news_model.dart';

class NewsConroller extends GetxController {
  final selectedIndex = 0.obs;
  final isLoading = false.obs;
  final isLoadingNews = false.obs;
  Rx<AppModel> appModel = AppModel().obs;
  Rx<NewsModel> newsModel = NewsModel().obs;

  RxList<Articles> articleList = <Articles>[].obs;

  @override
  void onInit() {
    getAppConfig();
    super.onInit();
  }

  void changeIndex(int index, String url) {
    selectedIndex.value = index;
    getNews(url);
  }

  Future<void> getAppConfig() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getAppConfig();
      appModel.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getNews(String url) async {
    isLoadingNews.value = true;
    try {
      final result = await ApiRepo().getNews(url: url);
      newsModel.value = result;
      articleList.value = result.articles ?? [];
    } catch (e) {
      isLoadingNews.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoadingNews.value = false;
    }
  }
}
