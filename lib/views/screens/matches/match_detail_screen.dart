import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/matches/h_to_h_widget.dart';
import 'package:football_score/views/screens/matches/lineup_widget.dart';
import 'package:football_score/views/screens/matches/standings_widget.dart';
import 'package:football_score/views/screens/team/team_detail_screen.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/match_detail_controller.dart';
import 'over_view_widget.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({super.key, required this.match});
  final Matches match;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final matchDetailController = Get.put(MatchDetailController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const CustomText(text: '', textColor: Colors.white, size: 20),
        ),
        body: Obx(
          () => matchDetailController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      height: 180.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/match_detail.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() => const TeamDetailScreen(),
                                arguments: {'teamId': widget.match.teamAId}),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FastCachedImage(
                                    width: 50.w,
                                    height: 50.h,
                                    fit: BoxFit.cover,
                                    url: matchDetailController
                                        .matchDetailModel
                                        .value
                                        .matchSample
                                        ?.teamALogo  ??
                                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                    fadeInDuration:
                                    const Duration(seconds: 1),
                                    errorBuilder: (context, exception,
                                        stacktrace) {
                                      return Image.asset(
                                          "assets/images/football_news.webp",
                                          fit: BoxFit.cover,
                                          width: 50.w,
                                          height: 50.w);
                                    },
                                    loadingBuilder:
                                        (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        height: 50.h,
                                        width: 50.w,
                                        color: secondaryColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress
                                                .isDownloading &&
                                                progress.totalBytes !=
                                                    null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style:
                                                  const TextStyle(
                                                      color: Colors
                                                          .red)),
                                            Center(
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
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

                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .15,
                                    child: Text(
                                      matchDetailController.matchDetailModel
                                              .value.matchSample?.teamAName ??
                                          '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  child: Text(
                                    "${matchDetailController.matchDetailModel.value.matchSample?.fsA ?? ''}  -  ${matchDetailController.matchDetailModel.value.matchSample?.fsB ?? ''}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: Text(
                                    DateFormat('d MMM, h:mm a').format(
                                        DateTime.parse((matchDetailController
                                                            .matchDetailModel
                                                            .value
                                                            .matchSample
                                                            ?.startPlay ??
                                                        '')
                                                    .contains('.')
                                                ? matchDetailController
                                                        .matchDetailModel
                                                        .value
                                                        .matchSample
                                                        ?.startPlay ??
                                                    ""
                                                : "${matchDetailController.matchDetailModel.value.matchSample?.startPlay}.000Z")
                                            .add(const Duration(hours: 8))),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                kSizedBoxH10,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: Text(
                                    (matchDetailController.matchDetailModel
                                                .value.matchSample?.status ==
                                            "Played"
                                        ? "Full Time"
                                        : matchDetailController
                                                    .matchDetailModel
                                                    .value
                                                    .matchSample
                                                    ?.minute ==
                                                "45"
                                            ? "Half Time"
                                            : ""),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => const TeamDetailScreen(),
                                arguments: {'teamId': widget.match.teamBId}),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FastCachedImage(
                                    width: 50.w,
                                    height: 50.h,
                                    fit: BoxFit.cover,
                                    url: matchDetailController
                                        .matchDetailModel
                                        .value
                                        .matchSample
                                        ?.teamBLogo  ??
                                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                    fadeInDuration:
                                    const Duration(seconds: 1),
                                    errorBuilder: (context, exception,
                                        stacktrace) {
                                      return Image.asset(
                                          "assets/images/football_news.webp",
                                          fit: BoxFit.cover,
                                          width: 50.w,
                                          height: 50.w);
                                    },
                                    loadingBuilder:
                                        (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        height: 50.h,
                                        width: 50.w,
                                        color: secondaryColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress
                                                .isDownloading &&
                                                progress.totalBytes !=
                                                    null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style:
                                                  const TextStyle(
                                                      color: Colors
                                                          .red)),
                                            Center(
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
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

                                  kSizedBoxW5,
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .15,
                                    child: Text(
                                      matchDetailController.matchDetailModel
                                              .value.matchSample?.teamBName ??
                                          '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    kSizedBoxH20,

                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(
                          25.r,
                        ),
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: tabController,
                        onTap: (value) {
                          if (value == 0 || value == 2) {
                            matchDetailController.getOverview();
                          } else if (value == 1) {
                            matchDetailController.getLineUp();
                          } else {
                            matchDetailController.getPreview();
                          }
                        },
                        padding: EdgeInsets.all(5.w),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.r,
                          ),
                          color: secondaryColor,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(
                            text: 'overall'.tr,
                          ),
                          Tab(
                            text: 'lineups'.tr,
                          ),
                          Tab(
                            text: 'standing'.tr,
                          ),
                          const Tab(
                            text: 'H2H',
                          ),
                        ],
                      ),
                    ),
                    // tab bar view here
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : OverviewWidget(
                                    statisticModel:
                                        matchDetailController.statisticModel,
                                    eventModel:
                                        matchDetailController.eventModel,
                                  ),
                          ),
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : LineupWidget(
                                    lineupModel:
                                        matchDetailController.lineupModel.value,
                                  ),
                          ),
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : matchDetailController.rankingModel.isEmpty
                                    ? const Center(
                                        child: CustomText(
                                          text: 'No Data Found',
                                        ),
                                      )
                                    : StandingsWidget(
                                        rankingModel:
                                            matchDetailController.rankingModel,
                                      ),
                          ),
                          Obx(() => matchDetailController.isLoadingTab.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : HToHWidget(
                                  previewModel:
                                      matchDetailController.previewModel.value,
                                )),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }
}
