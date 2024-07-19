import 'package:football_score/models/app_model.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/models/preview_model.dart';
import 'package:football_score/services/api_constant.dart';
import 'package:football_score/services/api_utils.dart';
import 'package:football_score/utils/custom_exception.dart';
import 'package:get_storage/get_storage.dart';

import '../models/lineup_model.dart';
import '../models/match_detail_model.dart';
import '../models/news_model.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<AppModel> getAppConfig() async {
    final box = GetStorage();
    String language = box.read('language') ?? 'en';
    try {
      final response =
          await apiUtils.get(url: ApiConstant.baseUrl, queryParameters: {
        "mark": "gif",
        "version": 373,
        "app": "",
        "language": language == "en" ? "en" : "zh-CN",
      });
      final appConfig = response.data;
      return AppModel.fromJson(appConfig);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<NewsModel> getNews({required String url}) async {
    final box = GetStorage();
    String language = box.read('language') ?? 'en';
    try {
      final response = await apiUtils.get(url: url, queryParameters: {
        "language": language == "en" ? "en-US" : "zh-CN",
      });
      final news = response.data;
      return NewsModel.fromJson(news);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<MatchModel> getMatches({required String url}) async {
    try {
      final response = await apiUtils.get(
        url: url,
      );
      final matches = response.data;
      return MatchModel.fromJson(matches);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<MatchDetailModel> getMatchDetail({required String matchId}) async {
    final box = GetStorage();
    String language = box.read('language') ?? 'en';
    try {
      final response =
          await apiUtils.get(url: ApiConstant.matchDetailUrl, queryParameters: {
        "id": matchId,
        "version": 373,
        "language": language == "en" ? "en-US" : "zh-CN",
        "app": "af",
      });
      final matches = response.data;
      return MatchDetailModel.fromJson(matches);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<LineupModel> getLineup({required String matchId}) async {
    final box = GetStorage();
    String language = box.read('language') ?? 'en';
    try {
      final response = await apiUtils
          .get(url: ApiConstant.lineUpUrl + matchId, queryParameters: {
        "app": "af",
        "version": 373,
        "language": language == "en" ? "en-US" : "zh-CN",
      });
      final lineups = response.data;
      return LineupModel.fromJson(lineups);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<PreviewModel> getPreview({required String matchId}) async {
    final box = GetStorage();
    String language = box.read('language') ?? 'en';
    try {
      final response = await apiUtils
          .get(url: ApiConstant.previewUrl + matchId, queryParameters: {
        "app": "af",
        "language": language == "en" ? "en-US" : "zh-CN",
      });
      final previews = response.data;
      return PreviewModel.fromJson(previews);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
