import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  CachedNetworkImage(
                    width: 40.w,
                    height: 40.h,
                    imageUrl:
                        teamDetailController.teamDetailModel.value.teamImg ??
                            '',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                          //matchDetailController.getOverview();
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
                    Center(
                      child: CustomText(text: 'Fixture'),
                    ),
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : StatsWidget(
                        teamName: teamDetailController.teamDetailModel.value.teamName ?? '',
                              teamStatsModel:
                                  teamDetailController.teamStatsModel.value),
                    ),
                    Obx(
                      () => teamDetailController.isLoadingTab.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : PlayerWidget(
                              teamMemberModel:
                                  teamDetailController.teamMemberModel.value,
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
