import 'package:flutter/material.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';

import '../models/match_detail_model.dart';

class MatchDetailController extends GetxController {
  final matchId = 0.obs;
  final isLoading = false.obs;
  Rx<MatchDetailModel> matchDetailModel = MatchDetailModel().obs;

  @override
  void onInit() {
    matchId.value = Get.arguments['matchId'];
    getMatchDetail();
    super.onInit();
  }

  Future<void> getMatchDetail() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatchDetail(matchId: matchId.value);
      matchDetailModel.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
