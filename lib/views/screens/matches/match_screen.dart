import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          toolbarHeight: 12.h,
        ),
        body: Padding(
          padding: EdgeInsets.all(6.h),
          child: Column(
            children: [
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: secondaryColor,
                deactivatedColor: Colors.red,
                dateTextStyle: const TextStyle(color: Colors.white),
                monthTextStyle: const TextStyle(color: Colors.white),
                dayTextStyle: const TextStyle(color: Colors.white),
                width: 60.w,
                height: 70.h,
                onDateChange: (date) {
                  print(date);
                  matchController.selectedDate.value = date;
                  matchController.getMatches(matchController.selectedUrl.value);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => appConfigController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : appConfigController.mTabList.isNotEmpty
                        ? SizedBox(
                            height: 28.h,
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
                                          appConfigController
                                                  .mTabList[index].api ??
                                              '');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: matchController
                                                      .selectedIndex.value ==
                                                  index
                                              ? secondaryColor
                                              : greyColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: CustomText(
                                        size: 10.sp,
                                        text: appConfigController
                                                .mTabList[index].label ??
                                            '',
                                        textColor: matchController
                                                    .selectedIndex.value ==
                                                index
                                            ? whiteColor
                                            : blackTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CustomText(
                              text: "No Data Found",
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
                      : matchController.matchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: matchController.matchList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => MatchDetailScreen(
                                              match: matchController
                                                  .matchList[index],
                                            ),
                                        arguments: {
                                          'matchId': matchController
                                              .matchList[index].matchId,
                                        });
                                  },
                                  child: Card(
                                    color: cardColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                                                    matchController
                                                            .matchList[index]
                                                            .teamAName ??
                                                        '',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: lightWhiteColor,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ),
                                                kSizedBoxW5,
                                                CachedNetworkImage(
                                                  width: 18.w,
                                                  height: 18.h,
                                                  imageUrl: matchController
                                                          .matchList[index]
                                                          .teamALogo ??
                                                      '',
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .15,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${matchController.matchList[index].fsA ?? ''} - ${matchController.matchList[index].fsB ?? ''}",
                                                  style: TextStyle(
                                                      color: lightWhiteColor,
                                                      fontSize: 8.sp),
                                                ),
                                                Text(
                                                  "  vs  ",
                                                  style: TextStyle(
                                                      color: lightWhiteColor,
                                                      fontSize: 8.sp),
                                                ),
                                                Text(
                                                  "  ${matchController.matchList[index].dateUtc ?? ''}  ",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: lightWhiteColor,
                                                      fontSize: 8.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CachedNetworkImage(
                                                  width: 18.w,
                                                  height: 18.h,
                                                  imageUrl: matchController
                                                          .matchList[index]
                                                          .teamBLogo ??
                                                      '',
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                                kSizedBoxW5,
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .15,
                                                  child: Text(
                                                    matchController
                                                            .matchList[index]
                                                            .teamBName ??
                                                        '',
                                                    style: TextStyle(
                                                      color: lightWhiteColor,
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
                                text: "No Data Found",
                              ),
                            ),
                ),
              )
            ],
          ),
        ));
  }
}
