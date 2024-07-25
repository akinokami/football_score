import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_info_model.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/custom_text.dart';

class InfoWidget extends StatelessWidget {
  final TeamInfoModel? teamInfoModel;
  const InfoWidget({
    super.key,
    this.teamInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10.h),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5.w),
              color: greyColor.withOpacity(0.6),
              child: CustomText(text: 'info'.tr)),
          Container(
            color: greyColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Opacity(
                          opacity: 0.5,
                          child: CustomText(text: 'founded_in'.tr)),
                      CustomText(text: teamInfoModel?.baseInfo?.founded ?? ''),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Opacity(
                          opacity: 0.5, child: CustomText(text: 'location'.tr)),
                      CustomText(
                          text:
                              "${teamInfoModel?.baseInfo?.country ?? ''}, ${teamInfoModel?.baseInfo?.city ?? ''}"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(opacity: 0.5, child: CustomText(text: 'home'.tr)),
                      Expanded(
                        child: CustomText(
                          text:
                              "${teamInfoModel?.baseInfo?.venueName ?? ''}, Capacity ${teamInfoModel?.baseInfo?.venueCapacity ?? ''}",
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: greyColor.withOpacity(0.6),
              padding: EdgeInsets.all(5.w),
              child: CustomText(text: 'contact_information'.tr)),
          Container(
            color: greyColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Opacity(opacity: 0.5, child: CustomText(text: 'tel'.tr)),
                      CustomText(
                          text: teamInfoModel?.baseInfo?.telephone ?? ''),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Opacity(
                          opacity: 0.5, child: CustomText(text: 'email'.tr)),
                      CustomText(text: teamInfoModel?.baseInfo?.email ?? ''),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                          opacity: 0.5, child: CustomText(text: 'address'.tr)),
                      Expanded(
                        child: CustomText(
                          text: teamInfoModel?.baseInfo?.address ?? '',
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          if ((teamInfoModel?.teamRecord?.length ?? 0) > 0 &&
              teamInfoModel?.teamRecord?[0].type == "Goals")
            Container(
                color: greyColor.withOpacity(0.6),
                padding: EdgeInsets.all(5.w),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'club_records'.tr),
                    CustomText(text: 'goals'.tr),
                  ],
                )),
          ((teamInfoModel?.teamRecord?.length ?? 0) > 0 &&
                  teamInfoModel?.teamRecord?[0].type == "Goals")
              ? Container(
                  color: greyColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        teamInfoModel?.teamRecord?[0].trophyData?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        color: index % 2 != 0
                            ? greyColor.withOpacity(0.6)
                            : whiteColor.withOpacity(0.6),
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 15.w,
                                  child: CustomText(
                                      textColor: index % 2 != 0
                                          ? lightWhiteColor
                                          : cardColor,
                                      textAlign: TextAlign.right,
                                      text: "${index + 1}"),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                FastCachedImage(
                                  width: 20.w,
                                  height: 20.h,
                                  fit: BoxFit.contain,
                                  url: teamInfoModel?.teamRecord?[0]
                                          .trophyData?[index].personLogo ??
                                      "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                  fadeInDuration: const Duration(seconds: 1),
                                  errorBuilder:
                                      (context, exception, stacktrace) {
                                    return Image.asset(
                                      "assets/images/football_news.webp",
                                      fit: BoxFit.contain,
                                      width: 20.w,
                                      height: 20.h,
                                    );
                                  },
                                  loadingBuilder: (context, progress) {
                                    debugPrint(
                                        'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                    return Container(
                                      width: 20.w,
                                      height: 20.h,
                                      //color: secondaryColor,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          if (progress.isDownloading &&
                                              progress.totalBytes != null)
                                            Text(
                                                '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                style: const TextStyle(
                                                    color: Colors.red)),
                                          Center(
                                            child: SizedBox(
                                                width: 10,
                                                height: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.white,
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
                                  width: 10.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        textColor: index % 2 != 0
                                            ? Colors.white
                                            : Colors.black,
                                        text: teamInfoModel
                                                ?.teamRecord?[0]
                                                .trophyData?[index]
                                                .personName ??
                                            ''),
                                    Opacity(
                                      opacity: 0.6,
                                      child: CustomText(
                                          textColor: index % 2 != 0
                                              ? Colors.white
                                              : Colors.black,
                                          size: 10.sp,
                                          text: teamInfoModel
                                                  ?.teamRecord?[0]
                                                  .trophyData?[index]
                                                  .birthDate ??
                                              ''),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CustomText(
                                textColor: index % 2 != 0
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                text: teamInfoModel?.teamRecord?[0]
                                        .trophyData?[index].statisticV1?[0] ??
                                    '')
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          SizedBox(
            height: 15.h,
          ),
          Container(
              color: greyColor.withOpacity(0.6),
              padding: EdgeInsets.all(5.w),
              width: MediaQuery.of(context).size.width,
              child: CustomText(text: 'trophies'.tr)),
          Container(
            color: greyColor,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: teamInfoModel?.trophyInfo?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      child: CustomText(
                          size: 10.sp,
                          text:
                              "${teamInfoModel?.trophyInfo?[index].competitionName ?? ''} x ${teamInfoModel?.trophyInfo?[index].lists?.length ?? ''}"),
                    ),
                    SizedBox(
                      height: 65.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              teamInfoModel?.trophyInfo?[index].lists?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 7.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FastCachedImage(
                                    width: 35.w,
                                    height: 35.h,
                                    fit: BoxFit.contain,
                                    url: teamInfoModel
                                            ?.trophyInfo?[index].trophyImg ??
                                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                    fadeInDuration: const Duration(seconds: 1),
                                    errorBuilder:
                                        (context, exception, stacktrace) {
                                      return Image.asset(
                                        "assets/images/football_news.webp",
                                        fit: BoxFit.contain,
                                        width: 35.w,
                                        height: 35.h,
                                      );
                                    },
                                    loadingBuilder: (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        width: 35.w,
                                        height: 35.h,
                                        //color: secondaryColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress.isDownloading &&
                                                progress.totalBytes != null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style: const TextStyle(
                                                      color: Colors.red)),
                                            Center(
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Colors.white,
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
                                  Opacity(
                                    opacity: 0.7,
                                    child: CustomText(
                                        size: 8.sp,
                                        text: teamInfoModel?.trophyInfo?[index]
                                                .lists?[i].seasonName ??
                                            ''),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
