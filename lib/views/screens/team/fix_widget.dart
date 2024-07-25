import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/team_detail_controller.dart';
import 'package:football_score/models/team_fix_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_text.dart';

class FixWidget extends StatelessWidget {
  final TeamFixModel? teamFixModel;
  const FixWidget({super.key, this.teamFixModel});

  @override
  Widget build(BuildContext context) {
    final teamDetailController = Get.put(TeamDetailController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (teamDetailController.seasonList.isNotEmpty)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 40.h,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(() => DropdownButton<SeasonList>(
                        dropdownColor: greyColor,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        iconEnabledColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        value: teamDetailController.selectedSeason.value,
                        hint: const CustomText(
                          text: 'Select Season',
                          textColor: Colors.white,
                        ),
                        alignment: AlignmentDirectional.centerStart,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        items: teamDetailController.seasonList
                            .map<DropdownMenuItem<SeasonList>>(
                                (SeasonList? value) {
                          return DropdownMenuItem<SeasonList>(
                            value: value,
                            child: Center(
                              child: CustomText(
                                textAlign: TextAlign.center,
                                text: value?.name,
                                //textColor: blackTextColor,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (SeasonList? newValue) {
                          teamDetailController.selectedSeason.value = newValue;
                          teamDetailController.getTeamFixYear(
                              newValue?.url ?? '', newValue!);
                        },
                      )),
                ),
              ),
            ),
          kSizedBoxH10,
          Obx(
            () => Expanded(
              child: teamDetailController.isLoadingFix.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : teamFixModel?.matchList?.isEmpty ?? true
                      ? const Center(
                          child: CustomText(
                            text: 'No Data Found',
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: teamFixModel?.matchList?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: DateFormat(
                                                    'dd-MMM-yyyy, hh:mm a')
                                                .format(DateTime.parse(
                                                    teamFixModel
                                                            ?.matchList?[index]
                                                            .startPlay ??
                                                        '')),
                                            size: 10.sp,
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: CustomText(
                                              text: teamFixModel
                                                      ?.matchList?[index]
                                                      .competitionName ??
                                                  '',
                                              size: 9.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 30.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 45.w,
                                                child: CustomText(
                                                  textAlign: TextAlign.left,
                                                  text: teamFixModel
                                                          ?.matchList?[index]
                                                          .teamAName ??
                                                      '',
                                                  size: 8.sp,
                                                  maxLines: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                                child: FastCachedImage(
                                                  width: 20.w,
                                                  height: 20.h,
                                                  fit: BoxFit.contain,
                                                  url: teamFixModel
                                                          ?.matchList?[index]
                                                          .teamALogo ??
                                                      "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                                  fadeInDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  errorBuilder: (context,
                                                      exception, stacktrace) {
                                                    return Image.asset(
                                                      "assets/images/football_news.webp",
                                                      fit: BoxFit.contain,
                                                      width: 20.w,
                                                      height: 20.h,
                                                    );
                                                  },
                                                  loadingBuilder:
                                                      (context, progress) {
                                                    debugPrint(
                                                        'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                    return Container(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      color: secondaryColor,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          if (progress
                                                                  .isDownloading &&
                                                              progress.totalBytes !=
                                                                  null)
                                                            Text(
                                                                '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                                style: const TextStyle(
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
                                              ),
                                              SizedBox(
                                                width: 25.w,
                                                child: CustomText(
                                                  textAlign: TextAlign.center,
                                                  size: 9.sp,
                                                  text:
                                                      "${teamFixModel?.matchList?[index].fsA ?? ''} - ${teamFixModel?.matchList?[index].fsB ?? ''}",
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                                child: FastCachedImage(
                                                  width: 20.w,
                                                  height: 20.h,
                                                  fit: BoxFit.contain,
                                                  url: teamFixModel
                                                          ?.matchList?[index]
                                                          .teamBLogo ??
                                                      "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                                  fadeInDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  errorBuilder: (context,
                                                      exception, stacktrace) {
                                                    return Image.asset(
                                                      "assets/images/football_news.webp",
                                                      fit: BoxFit.contain,
                                                      width: 20.w,
                                                      height: 20.h,
                                                    );
                                                  },
                                                  loadingBuilder:
                                                      (context, progress) {
                                                    debugPrint(
                                                        'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                    return Container(
                                                      width: 20.w,
                                                      height: 20.h,
                                                      color: secondaryColor,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          if (progress
                                                                  .isDownloading &&
                                                              progress.totalBytes !=
                                                                  null)
                                                            Text(
                                                                '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                                style: const TextStyle(
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
                                              ),
                                              SizedBox(
                                                width: 45.w,
                                                child: CustomText(
                                                  textAlign: TextAlign.right,
                                                  text: teamFixModel
                                                          ?.matchList?[index]
                                                          .teamBName ??
                                                      '',
                                                  size: 8.sp,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
            ),
          )
        ],
      ),
    );
  }
}
