import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/models/overview_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/matches/h_to_h_widget.dart';
import 'package:football_score/views/screens/matches/lineup_widget.dart';
import 'package:football_score/views/screens/matches/overall_widget.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/match_controller.dart';
import '../../../controller/match_detail_controller.dart';

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
    final matchDetailController = Get.put(MatchDetailController());
    final matchController = Get.put(MatchController());
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
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/match_detail.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  width: 50,
                                  height: 50,
                                  imageUrl: matchDetailController
                                          .matchDetailModel
                                          .value
                                          .matchSample
                                          ?.teamALogo ??
                                      '',
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  child: Text(
                                    matchDetailController.matchDetailModel.value
                                            .matchSample?.teamAName ??
                                        '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: Text(
                                    DateFormat('d MMM, h:mm a').format(
                                      DateTime.parse(
                                        "${matchDetailController.matchDetailModel.value.matchSample?.dateUtc ?? ''} ${matchDetailController.matchDetailModel.value.matchSample?.timeUtc ?? ''}",
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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
                                                .value.matchSample?.fsA !=
                                            ""
                                        ? "Full Time"
                                        : "Half Time"),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  width: 50,
                                  height: 50,
                                  imageUrl: matchDetailController
                                          .matchDetailModel
                                          .value
                                          .matchSample
                                          ?.teamBLogo ??
                                      '',
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                kSizedBoxW5,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  child: Text(
                                    matchDetailController.matchDetailModel.value
                                            .matchSample?.teamBName ??
                                        '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      child: TabBar(
                        labelPadding: const EdgeInsets.all(5.0),
                        indicatorPadding: const EdgeInsets.all(0.0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: tabController,
                        onTap: (value) {
                          if (value == 0) {
                            matchDetailController.getLineUp();
                          } else {
                            matchDetailController.getPreview();
                          }
                        },
                        padding: const EdgeInsets.all(5.0),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: secondaryColor,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            text: 'Lineups',
                          ),
                          Tab(
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
                          // Obx(
                          //   () => matchController.isLoading.value
                          //       ? const Center(
                          //           child: CircularProgressIndicator(),
                          //         )
                          //       : OverviewWidget(
                          //           overviewModel: matchDetailController
                          //               .overviewModel.value,
                          //         ),
                          // ),
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
