import 'package:football_score/models/app_model.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/services/api_constant.dart';
import 'package:football_score/services/api_utils.dart';
import 'package:football_score/utils/custom_exception.dart';
import 'package:get/get.dart';
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
    try {
      final response =
          await apiUtils.get(url: ApiConstant.matchDetailUrl, queryParameters: {
        "id": matchId,
        "version": 373,
        "language": "en",
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
        "language": "en",
      });
      final lineups = response.data;
      return LineupModel.fromJson(lineups);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  /// Movie
  // Future<List<SliderModel>> getMovieSlider() async {
  //   try {
  //     final response = await apiUtils
  //         .get(url: "${ApiConstant.display}SliderItem", queryParameters: {
  //       "\$filter":
  //           "displayLocation eq 'movies'  and deletedAt eq null and status eq true",
  //       "\$select":
  //           "name,bannerType,htmlCode,webLink,displayLocation,imageUrl,status,titleId"
  //     });
  //     final movieSliderList = response.data['value'] as List;
  //     return movieSliderList.map((item) => SliderModel.fromJson(item)).toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<MovieBuilderModel>> getMovieBuilderList() async {
  //   try {
  //     final response =
  //         await apiUtils.get(url: "${ApiConstant.display}moviebuilder");
  //     final movieBuilderList = response.data['value'] as List;
  //     return movieBuilderList
  //         .map((item) => MovieBuilderModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // ///Home
  // Future<List<SliderModel>> getHomeSlider() async {
  //   try {
  //     final response = await apiUtils
  //         .get(url: "${ApiConstant.display}SliderItem", queryParameters: {
  //       "\$filter":
  //           "displayLocation eq 'home'  and deletedAt eq null and status eq true",
  //       "\$select":
  //           "name,bannerType,htmlCode,webLink,displayLocation,imageUrl,status,titleId"
  //     });
  //     final homeSliderList = response.data['value'] as List;
  //     return homeSliderList.map((item) => SliderModel.fromJson(item)).toList();
  //   } catch (e) {
  //     print("error>>>>>>>>>>>>>${e.toString()}");
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<MovieModel>> getRecommendedPlayList() async {
  //   try {
  //     final response = await apiUtils.get(
  //         url:
  //             "${ApiConstant.display}Playlist/Recommend/Home/0b079075-ce13-11ed-bf4d-0e001b930b03");
  //     final recommendedPlayList = response.data['value']['titles'] as List;
  //     return recommendedPlayList
  //         .map((item) => MovieModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<MovieBuilderModel>> getHomeBuiderList() async {
  //   try {
  //     final response =
  //         await apiUtils.get(url: "${ApiConstant.display}homebuilder");
  //     final homeBuiderList = response.data['value'] as List;
  //     return homeBuiderList
  //         .map((item) => MovieBuilderModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // /// Series
  // Future<List<SliderModel>> getSeriesSlider() async {
  //   try {
  //     final response = await apiUtils
  //         .get(url: "${ApiConstant.display}SliderItem", queryParameters: {
  //       "\$filter":
  //           "displayLocation eq 'series'  and deletedAt eq null and status eq true",
  //       "\$select":
  //           "name,bannerType,htmlCode,webLink,displayLocation,imageUrl,status,titleId"
  //     });
  //     final seriesSliderList = response.data['value'] as List;
  //     return seriesSliderList
  //         .map((item) => SliderModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<MovieBuilderModel>> getSeriesBuilderList() async {
  //   try {
  //     final response =
  //         await apiUtils.get(url: "${ApiConstant.display}seriesbuilder");
  //     final seriesBuilderList = response.data['value'] as List;
  //     return seriesBuilderList
  //         .map((item) => MovieBuilderModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // // GET Movie Detail
  // Future<MovieDetailModel> getMoviesDetail(movieID) async {
  //   try {
  //     final response =
  //         await apiUtils.get(url: "${ApiConstant.content}MovieDetail/$movieID");
  //     final movieDetail = response.data['value'];
  //     return MovieDetailModel.fromJson(movieDetail);
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // // Get Related PLaylist
  // Future<List<MovieModel>> getRelatedPlayList(movieID) async {
  //   try {
  //     final response = await apiUtils.get(
  //         url: "${ApiConstant.content}MovieDetail/RelatedMovie/$movieID");
  //     final getRelatedPlayList = response.data['value'] as List;
  //     return getRelatedPlayList
  //         .map((item) => MovieModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // /// Continue Watching
  // Future<List<ContinueWatchingModel>> getContiuneWatchingList() async {
  //   try {
  //     final response = await apiUtils.get(
  //         url:
  //             "${ApiConstant.display}ContinueWatchingPlaylist?userId=c5a5a1bd-e066-4eb7-82b9-e48102d21298");
  //     final getContiuneWatchingList = response.data['value']['titles'] as List;
  //     return getContiuneWatchingList
  //         .map((item) => ContinueWatchingModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // //Favorite
  // Future<List<MovieModel>> getFavoriteList({required String userId}) async {
  //   try {
  //     final response = await apiUtils.get(
  //         url: "${ApiConstant.profile}Custom/Favourites",
  //         queryParameters: {"userId": userId});
  //     final favList = response.data['value'] as List;
  //     return favList.map((item) => MovieModel.fromJson(item)).toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // //Series Detail
  // Future<MovieDetailModel> getSeriesDetail(seriesId) async {
  //   try {
  //     final response = await apiUtils.get(
  //         url: "${ApiConstant.content}SeriesDetail/$seriesId");
  //     final movieDetail = response.data['value'];
  //     return MovieDetailModel.fromJson(movieDetail);
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<MovieModel>> getRelatedSeriesList(seriesId) async {
  //   try {
  //     final response = await apiUtils.get(
  //         url: "${ApiConstant.content}SeriesDetail/RelatedSeries/$seriesId");
  //     final getRelatedPlayList = response.data['value'] as List;
  //     return getRelatedPlayList
  //         .map((item) => MovieModel.fromJson(item))
  //         .toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  // Future<List<EpisodeModel>> getEpisodeList(seriesId) async {
  //   try {
  //     final response = await apiUtils
  //         .get(url: "${ApiConstant.content}Episodes", queryParameters: {
  //       "\$filter": "seasonId eq $seriesId",
  //       "\$select":
  //           "id,titleEn,titleMm,isPremium,descriptionEn,descriptionMm,posterPortrait,posterLandscape"
  //     });
  //     final episodeList = response.data['value'] as List;
  //     return episodeList.map((item) => EpisodeModel.fromJson(item)).toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }
}
