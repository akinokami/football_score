import 'package:flutter/material.dart';
import 'package:football_score/models/lineup_model.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:football_score/utils/constants.dart';
import 'package:get/get.dart';

import '../models/match_detail_model.dart';

class MatchDetailController extends GetxController {
  final matchId = ''.obs;
  final isLoading = false.obs;
  final isLoadingTab = false.obs;
  Rx<MatchDetailModel> matchDetailModel = MatchDetailModel().obs;
  Rx<LineupModel> lineupModel = LineupModel().obs;

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

  Future<void> getLineUp() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getLineup(matchId: matchId.value);
      lineupModel.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
