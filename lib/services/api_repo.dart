import 'package:football_score/models/app_model.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/models/preview_model.dart';
import 'package:football_score/models/team_member_model.dart';
import 'package:football_score/models/team_stats_model.dart';
import 'package:football_score/services/api_constant.dart';
import 'package:football_score/services/api_utils.dart';
import 'package:football_score/utils/custom_exception.dart';
import 'package:football_score/utils/global.dart';

import '../models/lineup_model.dart';
import '../models/match_detail_model.dart';
import '../models/news_model.dart';
import '../models/team_detail_model.dart';
import '../models/team_fix_model.dart';
import '../models/team_info_model.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<AppModel> getAppConfig() async {
    try {
      final response =
          await apiUtils.get(url: ApiConstant.baseUrl, queryParameters: {
        "mark": "gif",
        "version": 373,
        "app": "",
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en",
      });
      final appConfig = response.data;
      return AppModel.fromJson(appConfig);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<NewsModel> getNews({required String url}) async {
    try {
      final response = await apiUtils.get(url: url, queryParameters: {
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
      });
      final news = response.data;
      return NewsModel.fromJson(news);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<MatchModel> getMatches({required String url, String? date}) async {
    try {
      final response = await apiUtils.get(
        url: url,
        queryParameters: {'start': date},
      );
      final matches = response.data;
      return MatchModel.fromJson(matches);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<MatchDetailModel> getMatchDetail({required String matchId}) async {
    try {
      final response =
          await apiUtils.get(url: ApiConstant.matchDetailUrl, queryParameters: {
        "id": matchId,
        "version": 373,
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
        "app": "af",
      });
      final matches = response.data;
      return MatchDetailModel.fromJson(matches);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<LineupModel> getLineup({required String matchId}) async {
    try {
      final response = await apiUtils
          .get(url: ApiConstant.lineUpUrl + matchId, queryParameters: {
        "app": "af",
        "version": 373,
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
      });
      final lineups = response.data;
      return LineupModel.fromJson(lineups);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<PreviewModel> getPreview({required String matchId}) async {
    try {
      final response = await apiUtils
          .get(url: ApiConstant.previewUrl + matchId, queryParameters: {
        "app": "af",
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
      });
      final previews = response.data['data'][0];
      return PreviewModel.fromJson(previews);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<dynamic> getOverview({required String matchId}) async {
    try {
      final response = await apiUtils
          .get(url: ApiConstant.overviewUrl + matchId, queryParameters: {
        "app": "af",
        "version": 373,
        "force": 1,
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
      });
      // final overviews = response.data['data'][0];
      // return OverviewModel.fromJson(overviews);
      return response.data;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TeamDetailModel> getTeamDetail({required String teamId}) async {
    try {
      final response = await apiUtils
          .get(url: "${ApiConstant.teamDetailUrl}$teamId", queryParameters: {
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
        "app": "af",
      });
      final teams = response.data;
      return TeamDetailModel.fromJson(teams);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TeamInfoModel> getTeamInfo({required String teamId}) async {
    try {
      final response = await apiUtils
          .get(url: "${ApiConstant.teamInfoUrl}$teamId", queryParameters: {
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
        "app": "af",
      });
      final info = response.data;
      return TeamInfoModel.fromJson(info);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TeamMemberModel> getTeamPlayer({required String teamId}) async {
    try {
      final response = await apiUtils
          .get(url: "${ApiConstant.teamMemberUrl}$teamId", queryParameters: {
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
        "app": "af",
      });
      final players = response.data['data'];
      return TeamMemberModel.fromJson(players);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TeamStatsModel> getTeamStats({required String teamId}) async {
    try {
      final response = await apiUtils
          .get(url: "${ApiConstant.teamStatsUrl}$teamId", queryParameters: {
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
        "app": "af",
      });
      final players = response.data;
      return TeamStatsModel.fromJson(players);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TeamFixModel> getTeamFix({required String teamId}) async {
    try {
      final response = await apiUtils
          .get(url: "${ApiConstant.teamFixUrl}$teamId", queryParameters: {
        "version": 373,
        "app": "af",
        "language": Global.language == "zh"
            ? "zh-CN"
            : Global.language == "vi"
                ? "vi-VN"
                : "en-US",
      });
      final fixs = response.data;
      return TeamFixModel.fromJson(fixs);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
