import 'package:cached_network_image/cached_network_image.dart';
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
    // ignore: prefer_is_empty
    return lineupModel?.lupList?.length != 0
        ? const Center(
            child: CustomText(
              text: "No Data Found",
            ),
          )
        : Padding(
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
                                  CachedNetworkImage(
                                    width: 30.w,
                                    height: 30.h,
                                    imageUrl: lineupModel?.lupList?[0].lupData!
                                            .home!.start![index].person?.logo ??
                                        '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
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
                                    CachedNetworkImage(
                                      width: 30.w,
                                      height: 30.h,
                                      imageUrl: lineupModel
                                              ?.lupList?[0]
                                              .lupData
                                              ?.away
                                              ?.start?[index]
                                              .person
                                              ?.logo ??
                                          '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
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
                                  CachedNetworkImage(
                                    width: 30.w,
                                    height: 30.h,
                                    imageUrl: lineupModel?.lupList?[0].lupData!
                                            .home!.sub![index].person?.logo ??
                                        '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
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
                                    CachedNetworkImage(
                                      width: 30.w,
                                      height: 30.h,
                                      imageUrl: lineupModel
                                              ?.lupList?[0]
                                              .lupData
                                              ?.away
                                              ?.sub?[index]
                                              .person
                                              ?.logo ??
                                          '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
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
          );
  }
}
