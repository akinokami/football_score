import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../models/lineup_model.dart';

class LineupWidget extends StatelessWidget {
  final LineupModel? lineupModel;
  const LineupWidget({
    super.key,
    required this.lineupModel,
  });

  @override
  Widget build(BuildContext context) {
    return (lineupModel?.lupList?.length ?? 0) > 0
        ?  (lineupModel
                              ?.lupList?[0].lupData?.home?.start?.length??0)>0?
        Padding(
            padding: EdgeInsets.all(10.w),
            child: ListView(
              shrinkWrap: true,
              children: [
                if ((lineupModel?.lupList?[0].lupData?.home?.start?.length ??
                        0) >
                    0)
                  CustomText(text: 'starts'.tr),
                if ((lineupModel?.lupList?[0].lupData?.home?.start?.length ??
                        0) >
                    0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: lineupModel
                              ?.lupList?[0].lupData?.home?.start?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.end,
                                    text: lineupModel?.lupList?[0].lupData!
                                            .home!.start![index].person?.name ??
                                        '',
                                    size: 8.sp,
                                    textColor: Colors.white,
                                  ),
                                  kSizedBoxW10,
                                  FastCachedImage(
                                    width: 30.w,
                                    height: 30.h,
                                    fit: BoxFit.cover,
                                    url:lineupModel?.lupList?[0].lupData!
                                        .home!.start![index].person?.logo  ??
                                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                    fadeInDuration:
                                    const Duration(seconds: 1),
                                    errorBuilder: (context, exception,
                                        stacktrace) {
                                      return Image.asset(
                                        "assets/images/football_news.webp",
                                        fit: BoxFit.cover,
                                        width: 30.w,
                                        height: 30.h,);
                                    },
                                    loadingBuilder:
                                        (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        width: 30.w,
                                        height: 30.h,
                                        color: secondaryColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress
                                                .isDownloading &&
                                                progress.totalBytes !=
                                                    null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style:
                                                  const TextStyle(
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

                                  kSizedBoxW20,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      if ((lineupModel
                                  ?.lupList?[0].lupData?.away?.start?.length ??
                              0) >
                          0)
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: lineupModel
                                ?.lupList?[0].lupData?.away?.start?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Row(
                                  children: [
                                    kSizedBoxW20,
                                    FastCachedImage(
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.cover,
                                      url:lineupModel
                                          ?.lupList?[0]
                                          .lupData
                                          ?.away
                                          ?.start?[index]
                                          .person
                                          ?.logo  ??
                                          "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                      fadeInDuration:
                                      const Duration(seconds: 1),
                                      errorBuilder: (context, exception,
                                          stacktrace) {
                                        return Image.asset(
                                          "assets/images/football_news.webp",
                                          fit: BoxFit.cover,
                                          width: 30.w,
                                          height: 30.h,);
                                      },
                                      loadingBuilder:
                                          (context, progress) {
                                        debugPrint(
                                            'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                        return Container(
                                          width: 30.w,
                                          height: 30.h,
                                          color: secondaryColor,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              if (progress
                                                  .isDownloading &&
                                                  progress.totalBytes !=
                                                      null)
                                                Text(
                                                    '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                    style:
                                                    const TextStyle(
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

                                    kSizedBoxW10,
                                    CustomText(
                                      text: lineupModel
                                              ?.lupList?[0]
                                              .lupData
                                              ?.away
                                              ?.start![index]
                                              .person
                                              ?.name ??
                                          '',
                                      size: 8.sp,
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                Divider(
                  color: lightWhiteColor,
                ),
                if ((lineupModel?.lupList?[0].lupData?.home?.sub?.length ?? 0) >
                    0)
                  CustomText(text: 'subtitutes'.tr),
                if ((lineupModel?.lupList?[0].lupData?.home?.sub?.length ?? 0) >
                    0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: lineupModel
                              ?.lupList?[0].lupData?.home?.sub?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.end,
                                    text: lineupModel?.lupList?[0].lupData!
                                            .home!.sub![index].person?.name ??
                                        '',
                                    size: 8.sp,
                                    textColor: Colors.white,
                                  ),
                                  kSizedBoxW10,
                                  FastCachedImage(
                                    width: 30.w,
                                    height: 30.h,
                                    fit: BoxFit.cover,
                                    url:lineupModel?.lupList?[0].lupData!
                                        .home!.sub![index].person?.logo  ??
                                        "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                    fadeInDuration:
                                    const Duration(seconds: 1),
                                    errorBuilder: (context, exception,
                                        stacktrace) {
                                      return Image.asset(
                                        "assets/images/football_news.webp",
                                        fit: BoxFit.cover,
                                        width: 30.w,
                                        height: 30.h,);
                                    },
                                    loadingBuilder:
                                        (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        width: 30.w,
                                        height: 30.h,
                                        color: secondaryColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress
                                                .isDownloading &&
                                                progress.totalBytes !=
                                                    null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style:
                                                  const TextStyle(
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

                                  kSizedBoxW20,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      if ((lineupModel
                                  ?.lupList?[0].lupData?.away?.sub?.length ??
                              0) >
                          0)
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: lineupModel
                                ?.lupList?[0].lupData?.away?.sub?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Row(
                                  children: [
                                    kSizedBoxW20,
                                    FastCachedImage(
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.cover,
                                      url:lineupModel
                                          ?.lupList?[0]
                                          .lupData
                                          ?.away
                                          ?.sub?[index]
                                          .person
                                          ?.logo  ??
                                          "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                      fadeInDuration:
                                      const Duration(seconds: 1),
                                      errorBuilder: (context, exception,
                                          stacktrace) {
                                        return Image.asset(
                                          "assets/images/football_news.webp",
                                          fit: BoxFit.cover,
                                          width: 30.w,
                                          height: 30.h,);
                                      },
                                      loadingBuilder:
                                          (context, progress) {
                                        debugPrint(
                                            'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                        return Container(
                                          width: 30.w,
                                          height: 30.h,
                                          color: secondaryColor,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              if (progress
                                                  .isDownloading &&
                                                  progress.totalBytes !=
                                                      null)
                                                Text(
                                                    '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                    style:
                                                    const TextStyle(
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

                                    kSizedBoxW10,
                                    CustomText(
                                      text: lineupModel
                                              ?.lupList?[0]
                                              .lupData
                                              ?.away
                                              ?.sub![index]
                                              .person
                                              ?.name ??
                                          '',
                                      size: 8.sp,
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          )
        : const Center(
            child: CustomText(
              text: "No Data Found",
            ),
          ) : const Center(
            child: CustomText(
              text: "No Data Found",
            ),
          );
  }
}
