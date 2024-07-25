import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/views/screens/team/fix_widget.dart';
import 'package:football_score/views/screens/team/info_widget.dart';
import 'package:football_score/views/screens/team/player_widget.dart';
import 'package:football_score/views/screens/team/stats_widget.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../controller/team_detail_controller.dart';
import '../../../utils/app_theme.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({super.key});

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen>
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
    final teamDetailController = Get.put(TeamDetailController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const CustomText(text: '', textColor: Colors.white, size: 20),
      ),
      body: Obx(
        () => teamDetailController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  FastCachedImage(
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.contain,
                    url: teamDetailController.teamDetailModel.value.teamImg ??
                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return Image.asset(
                        "assets/images/football_news.webp",
                        fit: BoxFit.contain,
                        width: 40.w,
                        height: 40.h,
                      );
                    },
                    loadingBuilder: (context, progress) {
                      debugPrint(
                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                      return Container(
                        width: 40.w,
                        height: 40.h,
                        //color: secondaryColor,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (progress.isDownloading &&
                                progress.totalBytes != null)
                              Text(
                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                  style: const TextStyle(color: Colors.red)),
                            Center(
                              child: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: CircularProgressIndicator(
                                      color: Colors.white,
                                      value:
                                          progress.progressPercentage.value)),
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
                    height: 5.h,
                  ),
                  CustomText(
                    text: teamDetailController.teamDetailModel.value.teamName ??
                        '',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomText(
                    text: teamDetailController.teamDetailModel.value.rank ?? '',
                    size: 10.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
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
                        if (value == 0) {
                          teamDetailController.getTeamFix();
                        } else if (value == 1) {
                          teamDetailController.getTeamStats();
                        } else if (value == 2) {
                          teamDetailController.getTeamPlayer();
                        } else {
                          teamDetailController.getTeamInfo();
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
                          text: 'fixtures'.tr,
                        ),
                        Tab(
                          text: 'stats'.tr,
                        ),
                        Tab(
                          text: 'player'.tr,
                        ),
                        Tab(
                          text: 'info'.tr,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(controller: tabController, children: [
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : FixWidget(
                              teamFixModel:
                                  teamDetailController.teamFixModel.value,
                            ),
                    ),
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : StatsWidget(
                              teamName: teamDetailController
                                      .teamDetailModel.value.teamName ??
                                  '',
                              teamStatsModel:
                                  teamDetailController.teamStatsModel.value),
                    ),
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : teamDetailController
                                      .teamMemberModel.value.memberList ==
                                  null
                              ? const Center(
                                  child: CustomText(
                                    text: 'No Data Found',
                                  ),
                                )
                              : PlayerWidget(
                                  teamMemberModel: teamDetailController
                                      .teamMemberModel.value,
                                ),
                    ),
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : InfoWidget(
                              teamInfoModel:
                                  teamDetailController.teamInfoModel.value,
                            ),
                    )
                  ]))
                ],
              ),
      ),
    );
  }
}
