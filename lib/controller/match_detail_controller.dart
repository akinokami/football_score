import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_score/models/lineup_model.dart';
import 'package:football_score/models/overview_model.dart';
import 'package:football_score/models/preview_model.dart';
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
  Rx<PreviewModel> previewModel = PreviewModel().obs;
  Map<String, dynamic> overviewModel = <String, dynamic>{}.obs;

  @override
  void onInit() {
    matchId.value = Get.arguments['matchId'];
    getMatchDetail();
    getOverview();
    super.onInit();
  }

  Future<void> getMatchDetail() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatchDetail(matchId: matchId.value);
      matchDetailModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLineUp() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getLineup(matchId: matchId.value);
      lineupModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getPreview() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getPreview(matchId: matchId.value);
      previewModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getOverview() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getOverview(matchId: matchId.value);
      overviewModel = result;
      print("overviewModel>>>>$overviewModel");
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }
}
