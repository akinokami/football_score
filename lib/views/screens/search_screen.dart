import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/news/news_details_screen.dart';
import 'package:get/get.dart';

import '../../controller/news_controller.dart';
import '../widgets/custom_text.dart';
import 'matches/match_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());
    final newsController = Get.put(NewsController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 20.h,
          backgroundColor: primaryColor,
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(
                    25.r,
                  ),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.r,
                    ),
                    color: secondaryColor,
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      text: 'matches'.tr,
                    ),
                    Tab(
                      text: 'news'.tr,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: TextField(
                            controller: matchController.searchController,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                matchController.searchController;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.w),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: MaterialButton(
                                  color: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  onPressed: () {
                                    matchController.searchMatches();
                                    if (matchController
                                        .searchController.text.isEmpty) {
                                      Get.snackbar(
                                          'warning'.tr, 'please_enter_text'.tr,
                                          backgroundColor: Colors.white);
                                    }
                                  },
                                  child: Text('search'.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp)),
                                ),
                              ),
                              hintText: '${'search'.tr} ${'matches'.tr}',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.white, size: 18.sp),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        kSizedBoxH10,
                        Expanded(
                          child: Obx(
                            () => matchController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : (matchController.matchSearchList.isNotEmpty)
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: matchController
                                            .matchSearchList.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => MatchDetailScreen(
                                                        match: matchController
                                                                .matchSearchList[
                                                            index],
                                                      ),
                                                  arguments: {
                                                    'matchId': matchController
                                                        .matchSearchList[index]
                                                        .matchId,
                                                  });
                                            },
                                            child: Card(
                                              color: cardColor,
                                              child: Padding(
                                                padding: EdgeInsets.all(5.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .25,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .15,
                                                            child: Text(
                                                              matchController
                                                                      .matchSearchList[
                                                                          index]
                                                                      .teamAName ??
                                                                  '',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                color:
                                                                    lightWhiteColor,
                                                                fontSize: 9.sp,
                                                              ),
                                                            ),
                                                          ),
                                                          kSizedBoxW5,
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            child:
                                                                FastCachedImage(
                                                              width: 18.w,
                                                              height: 18.h,
                                                              fit: BoxFit
                                                                  .contain,
                                                              url: matchController
                                                                      .matchSearchList[
                                                                          index]
                                                                      .teamALogo ??
                                                                  "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                              errorBuilder:
                                                                  (context,
                                                                      exception,
                                                                      stacktrace) {
                                                                return Image
                                                                    .asset(
                                                                  "assets/images/football_news.webp",
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  width: 18.w,
                                                                  height: 18.h,
                                                                );
                                                              },
                                                              loadingBuilder:
                                                                  (context,
                                                                      progress) {
                                                                debugPrint(
                                                                    'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                                return Container(
                                                                  width: 18.w,
                                                                  height: 18.h,
                                                                  // color:
                                                                  //     secondaryColor,
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    children: [
                                                                      if (progress
                                                                              .isDownloading &&
                                                                          progress.totalBytes !=
                                                                              null)
                                                                        Text(
                                                                            '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                                            style:
                                                                                const TextStyle(color: Colors.red)),
                                                                      Center(
                                                                        child: SizedBox(
                                                                            width:
                                                                                10,
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                CircularProgressIndicator(color: Colors.white, value: progress.progressPercentage.value)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                                // return Center(
                                                                //   child: CircularProgressIndicator(),
                                                                // );
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .15,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "${matchController.matchSearchList[index].fsA ?? ''} - ${matchController.matchList[index].fsB ?? ''}",
                                                            style: TextStyle(
                                                                color:
                                                                    lightWhiteColor,
                                                                fontSize: 8.sp),
                                                          ),
                                                          Text(
                                                            "  vs  ",
                                                            style: TextStyle(
                                                                color:
                                                                    lightWhiteColor,
                                                                fontSize: 8.sp),
                                                          ),
                                                          Text(
                                                            "  ${matchController.matchSearchList[index].dateUtc ?? ''}  ",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color:
                                                                    lightWhiteColor,
                                                                fontSize: 8.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .25,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FastCachedImage(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            fit: BoxFit.contain,
                                                            url: matchController
                                                                    .matchSearchList[
                                                                        index]
                                                                    .teamBLogo ??
                                                                "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                                            fadeInDuration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            errorBuilder:
                                                                (context,
                                                                    exception,
                                                                    stacktrace) {
                                                              return Image
                                                                  .asset(
                                                                "assets/images/football_news.webp",
                                                                fit: BoxFit
                                                                    .contain,
                                                                width: 18.w,
                                                                height: 18.h,
                                                              );
                                                            },
                                                            loadingBuilder:
                                                                (context,
                                                                    progress) {
                                                              debugPrint(
                                                                  'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                              return Container(
                                                                width: 18.w,
                                                                height: 18.h,
                                                                // color:
                                                                //     secondaryColor,
                                                                child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    if (progress
                                                                            .isDownloading &&
                                                                        progress.totalBytes !=
                                                                            null)
                                                                      Text(
                                                                          '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                                          style:
                                                                              const TextStyle(color: Colors.red)),
                                                                    Center(
                                                                      child: SizedBox(
                                                                          width:
                                                                              10,
                                                                          height:
                                                                              10,
                                                                          child: CircularProgressIndicator(
                                                                              color: Colors.white,
                                                                              value: progress.progressPercentage.value)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                              // return Center(
                                                              //   child: CircularProgressIndicator(),
                                                              // );
                                                            },
                                                          ),
                                                          kSizedBoxW5,
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .15,
                                                            child: Text(
                                                              matchController
                                                                      .matchSearchList[
                                                                          index]
                                                                      .teamBName ??
                                                                  '',
                                                              style: TextStyle(
                                                                color:
                                                                    lightWhiteColor,
                                                                fontSize: 8.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const Center(
                                        child: CustomText(
                                          text: "No Matches Data Found",
                                        ),
                                      ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: TextField(
                            controller: newsController.searchController,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                newsController.searchController;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.w),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: MaterialButton(
                                  color: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  onPressed: () {
                                    newsController.searchNews();
                                    if (newsController
                                        .searchController.text.isEmpty) {
                                      Get.snackbar(
                                          'warning'.tr, 'please_enter_text'.tr,
                                          backgroundColor: Colors.white);
                                    }
                                  },
                                  child: Text('search'.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp)),
                                ),
                              ),
                              hintText: '${'search'.tr} ${'news'.tr}',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.white, size: 18.sp),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        kSizedBoxH10,
                        Expanded(
                          child: Obx(
                            () => newsController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : (newsController.searchArticleList.isNotEmpty)
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: newsController
                                            .searchArticleList.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => NewsDetailsScreen(
                                                  articles: newsController
                                                      .searchArticleList[index]
                                                      .body,
                                                  imageUrl: newsController
                                                      .searchArticleList[index]
                                                      .thumb,
                                                ),
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.w),
                                                padding: EdgeInsets.only(
                                                    left: 10.w, right: 10.w),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: cardColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child: FastCachedImage(
                                                        width: 70.w,
                                                        height: 70.h,
                                                        fit: BoxFit.cover,
                                                        url: newsController
                                                                .searchArticleList[
                                                                    index]
                                                                .thumb ??
                                                            "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                                        fadeInDuration:
                                                            const Duration(
                                                                seconds: 1),
                                                        errorBuilder: (context,
                                                            exception,
                                                            stacktrace) {
                                                          return Image.asset(
                                                            "assets/images/football_news.webp",
                                                            fit: BoxFit.cover,
                                                            width: 70.w,
                                                            height: 70.h,
                                                          );
                                                        },
                                                        loadingBuilder:
                                                            (context,
                                                                progress) {
                                                          debugPrint(
                                                              'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                          return Container(
                                                            width: 70.w,
                                                            height: 70.h,
                                                            // color:
                                                            //     secondaryColor,
                                                            child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                if (progress
                                                                        .isDownloading &&
                                                                    progress.totalBytes !=
                                                                        null)
                                                                  Text(
                                                                      '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.red)),
                                                                Center(
                                                                  child: SizedBox(
                                                                      width: 10,
                                                                      height:
                                                                          10,
                                                                      child: CircularProgressIndicator(
                                                                          color: Colors
                                                                              .white,
                                                                          value: progress
                                                                              .progressPercentage
                                                                              .value)),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                          // return Center(
                                                          //   child: CircularProgressIndicator(),
                                                          // );
                                                        },
                                                      ),
                                                    ),
                                                    kSizedBoxW10,
                                                    Expanded(
                                                      child: CustomText(
                                                        text: newsController
                                                                .searchArticleList[
                                                                    index]
                                                                .title ??
                                                            '',
                                                        maxLines: 3,
                                                        textColor: whiteColor,
                                                        size: 12.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                      )
                                    : const Center(
                                        child: CustomText(
                                          text: "No News Data Found",
                                        ),
                                      ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
