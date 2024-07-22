import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  final selectedIndex = 0.obs;
  final isLoading = false.obs;
  Rx<MatchModel> matchModel = MatchModel().obs;
  RxList<Matches> matchList = <Matches>[].obs;
  RxList<Matches> matchSearchList = <Matches>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    startMatch();
    super.onInit();
  }

  void searchMatches() {
    if (searchController.text.isNotEmpty) {
      matchSearchList.value = matchList
          .where((element) =>
              element.teamAName!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              element.teamBName!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  void startMatch() {
    if (Get.find<AppConfigController>().mTabList.isNotEmpty) {
      getMatches(Get.find<AppConfigController>().mTabList[0].api ?? '');
    }
    selectedIndex.value = 0;
  }

  void changeIndex(int index, String url) {
    selectedIndex.value = index;
    getMatches(url);
  }

  Future<void> getMatches(String url) async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatches(url: url);
      matchModel.value = result;
      matchList.value = result.list ?? [];
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
