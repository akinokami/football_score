import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../controller/match_detail_controller.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({super.key});

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
          title: const Text('Match Details',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: Obx(
          () => matchDetailController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          width: 75,
                          height: 75,
                          imageUrl: matchDetailController.matchDetailModel.value
                                  .matchSample?.teamALogo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        CachedNetworkImage(
                          width: 75,
                          height: 75,
                          imageUrl: matchDetailController.matchDetailModel.value
                                  .matchSample?.teamBLogo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      child: TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: Colors.green,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            text: 'Overview',
                          ),
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
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [CustomText(text: 'overview')],
                                  ),
                          ),
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [
                                      CustomText(text: 'Subtitution'),
                                      Row(
                                        children: [
                                          // ListView.builder(
                                          //     shrinkWrap: true,
                                          //     itemCount: matchDetailController.lineupModel.value.data.,
                                          //     itemBuilder: (context, index) {

                                          //     },)
                                        ],
                                      )
                                    ],
                                  ),
                          ),
                          Obx(
                            () => matchDetailController.isLoadingTab.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [CustomText(text: 'overview')],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }
}
