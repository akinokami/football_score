import 'package:flutter/material.dart';
import 'package:football_score/models/team_detail_model.dart';
import 'package:football_score/models/team_member_model.dart';
import 'package:football_score/services/api_repo.dart';
import 'package:get/get.dart';

import '../models/team_fix_model.dart';
import '../models/team_info_model.dart';
import '../models/team_stats_model.dart';
import '../utils/constants.dart';

class TeamDetailController extends GetxController {
  final teamId = ''.obs;
  final isLoading = false.obs;
  final isLoadingTab = false.obs;
  final isLoadingFix = false.obs;
  Rx<TeamDetailModel> teamDetailModel = TeamDetailModel().obs;
  Rx<TeamInfoModel> teamInfoModel = TeamInfoModel().obs;
  Rx<TeamMemberModel> teamMemberModel = TeamMemberModel().obs;
  Rx<TeamStatsModel> teamStatsModel = TeamStatsModel().obs;
  Rx<TeamFixModel> teamFixModel = TeamFixModel().obs;
  Rx<SeasonList?> selectedSeason = Rx<SeasonList?>(null);
  RxList<SeasonList> seasonList = <SeasonList>[].obs;

  @override
  void onInit() {
    teamId.value = Get.arguments['teamId'];
    getTeamDetail();
    getTeamFix();
    super.onInit();
  }

  Future<void> getTeamDetail() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getTeamDetail(teamId: teamId.value);
      teamDetailModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTeamInfo() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getTeamInfo(teamId: teamId.value);
      teamInfoModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getTeamPlayer() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getTeamPlayer(teamId: teamId.value);
      teamMemberModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getTeamStats() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getTeamStats(teamId: teamId.value);
      teamStatsModel.value = result;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getTeamFix() async {
    isLoadingTab.value = true;
    try {
      final result = await ApiRepo().getTeamFix(teamId: teamId.value);
      teamFixModel.value = result;
      seasonList.addAll(teamFixModel.value.seasonList ?? []);
      if (seasonList.isNotEmpty) {
        selectedSeason.value = seasonList.first;
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingTab.value = false;
    }
  }

  Future<void> getTeamFixYear(String url, SeasonList season) async {
    isLoadingFix.value = true;
    try {
      final result = await ApiRepo().getTeamFixYear(url: url);
      teamFixModel.value = result;
      if (teamFixModel.value.seasonList!.isNotEmpty) {
        selectedSeason.value = season;
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoadingFix.value = false;
    }
  }
}
