import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/utils/app_theme.dart';
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
      body: Padding(
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
                        itemCount: appConfigController
                            .appModel.value.menus?.matchTab?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => InkWell(
                              onTap: () {
                                matchController.changeIndex(
                                    index,
                                    appConfigController.appModel.value.menus
                                            ?.matchTab?[index].api ??
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
                                  text: appConfigController.appModel.value.menus
                                          ?.matchTab?[index].label ??
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
            Expanded(
              child: Obx(
                () => matchController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: matchController.matchList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              //
                            },
                            child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: greyColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      width: 75,
                                      height: 75,
                                      imageUrl: matchController
                                              .matchList[index].teamALogo ??
                                          '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: matchController
                                                .matchList[index].teamAName ??
                                            '',
                                        maxLines: 3,
                                        textColor: whiteColor,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
