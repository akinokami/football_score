import 'package:flutter/material.dart';
import 'package:football_score/models/lineup_model.dart';
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
  Map<String, dynamic> statisticModel = <String, dynamic>{}.obs;
  Map<String, dynamic> eventModel = <String, dynamic>{}.obs;
  Map<String, dynamic> rankingModel = <String, dynamic>{}.obs;

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
      if (overviewModel['data'].length > 0) {
        if (overviewModel['data']
                .where((element) => element['template'] == 'match_statistic')
                .length >
            0) {
          statisticModel = overviewModel['data']
              .where((element) => element['template'] == 'match_statistic')
              .toList()
              .first;
        }
        if (overviewModel['data']
                .where((element) => element['template'] == 'match_event')
                .length >
            0) {
          eventModel = overviewModel['data']
              .where((element) => element['template'] == 'match_event')
              .toList()
              .first;
        }
        if (overviewModel['data']
                .where(
                    (element) => element['template'] == 'match_ranking_group')
                .length >
            0) {
          rankingModel = overviewModel['data']
              .where((element) => element['template'] == 'match_ranking_group')
              .toList()
              .first;
        }
        print("statisticModel>>>>$statisticModel");
        print("eventModel>>>>$eventModel");
        print("rankingModel>>>>$rankingModel");
      }
      print("overviewModel>>>>$overviewModel");
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }
}
