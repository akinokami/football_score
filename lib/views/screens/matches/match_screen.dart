import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/match_controller.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/matches/match_detail_screen.dart';
import 'package:football_score/views/widgets/custom_fast_cache_image.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigController = Get.put(AppConfigController());
    final matchController = Get.put(MatchController());

    Future<void> selectCalenderDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: matchController.selectedDate.value,
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now().add(const Duration(days: 399)),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: secondaryColor, // Header background color
              hintColor: greyColor, // Header text and button color
              colorScheme: ColorScheme.light(
                  primary: secondaryColor), // Selected date color
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.values[1]), // Button text color
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        matchController.selectedDate.value = picked;
        matchController.datePickerController.setDateAndAnimate(picked);
        matchController.getMatches(matchController.selectedUrl.value);
      }
    }

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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => selectCalenderDate(context),
                  child: Icon(
                    Icons.calendar_month,
                    color: secondaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
              Obx(
                () => DatePicker(
                  DateTime.now().subtract(const Duration(days: 100)),
                  controller: matchController.datePickerController,
                  initialSelectedDate: matchController.selectedDate.value,
                  selectionColor: secondaryColor,
                  deactivatedColor: Colors.red,
                  dateTextStyle:
                      TextStyle(color: Colors.white, fontSize: 10.sp),
                  monthTextStyle:
                      TextStyle(color: Colors.white, fontSize: 10.sp),
                  dayTextStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
                  width: 60.w,
                  height: 70.h,
                  onDateChange: (date) {
                    matchController.selectedDate.value = date;
                    matchController.scrollToSelectedDate();
                    matchController
                        .getMatches(matchController.selectedUrl.value);
                  },
                ),
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
                                            : whiteColor,
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
                                String? dateUtc = (matchController
                                                .matchList[index].startPlay ??
                                            '')
                                        .contains('.')
                                    ? matchController.matchList[index].startPlay
                                    : "${matchController.matchList[index].startPlay}.000Z";
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
                                                CustomFastCacheNetworkImage(
                                                    url: matchController
                                                        .matchList[index]
                                                        .teamALogo,
                                                    width: 18,
                                                    height: 18)
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
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(DateTime.parse(
                                                              dateUtc ?? '')
                                                          .toLocal()),
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
                                                CustomFastCacheNetworkImage(
                                                    url: matchController
                                                        .matchList[index]
                                                        .teamBLogo,
                                                    width: 18,
                                                    height: 18),

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
