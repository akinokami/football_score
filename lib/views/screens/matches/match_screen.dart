import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/matches/match_detail_screen.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigController = Get.put(AppConfigController());
    final matchController = Get.put(MatchController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
      ),
      body:appConfigController.mTabList.isNotEmpty? Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Obx(
              () => appConfigController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 35,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: appConfigController.mTabList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                matchController.changeIndex(
                                    index,
                                    appConfigController.mTabList[index].api ??
                                        '');
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:
                                        matchController.selectedIndex.value ==
                                                index
                                            ? secondaryColor
                                            : greyColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: CustomText(
                                  size: 12,
                                  text: appConfigController
                                          .mTabList[index].label ??
                                      '',
                                  textColor:
                                      matchController.selectedIndex.value ==
                                              index
                                          ? whiteColor
                                          : blackTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            matchController.matchList.isNotEmpty? Expanded(
              child: Obx(
                () => matchController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: matchController.matchList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => MatchDetailScreen(
                                        match: matchController.matchList[index],
                                      ),
                                  arguments: {
                                    'matchId': matchController
                                        .matchList[index].matchId,
                                  });
                            },
                            child: Card(
                              color: cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .15,
                                            child: Text(
                                              matchController.matchList[index]
                                                      .teamAName ??
                                                  '',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: lightWhiteColor,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          kSizedBoxW5,
                                          CachedNetworkImage(
                                            width: 20,
                                            height: 20,
                                            imageUrl: matchController
                                                    .matchList[index]
                                                    .teamALogo ??
                                                '',
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      child: Column(
                                        children: [
                                          Text(
                                            "${matchController.matchList[index].fsA ?? ''} - ${matchController.matchList[index].fsB ?? ''}",
                                            style: TextStyle(
                                                color: lightWhiteColor,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            "  vs  ",
                                            style: TextStyle(
                                                color: lightWhiteColor,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            "  ${matchController.matchList[index].dateUtc ?? ''}  ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: lightWhiteColor,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            width: 20,
                                            height: 20,
                                            imageUrl: matchController
                                                    .matchList[index]
                                                    .teamBLogo ??
                                                '',
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          kSizedBoxW5,
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .15,
                                            child: Text(
                                              matchController.matchList[index]
                                                      .teamBName ??
                                                  '',
                                              style: TextStyle(
                                                color: lightWhiteColor,
                                                fontSize: 10,
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
                      ),
              ),
            ):const Center(
              child: Text("No Data Found"),
            ),
          ],
        ),
      ): Center(
        child: Text("No Data Found",style: TextStyle(
          color: whiteColor
        ),),
      )
    );
  }
}
