import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_info_model.dart';

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
              child: const CustomText(text: 'Info')),
          Container(
            color: greyColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Opacity(
                          opacity: 0.5,
                          child: CustomText(text: 'Founded in : ')),
                      CustomText(text: teamInfoModel?.baseInfo?.founded ?? ''),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Opacity(
                          opacity: 0.5, child: CustomText(text: 'Location : ')),
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
                    children: [
                      const Opacity(
                          opacity: 0.5, child: CustomText(text: 'Home : ')),
                      CustomText(
                          text:
                              "${teamInfoModel?.baseInfo?.venueName ?? ''}, Capacity ${teamInfoModel?.baseInfo?.venueCapacity ?? ''}"),
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
              child: const CustomText(text: 'Contact Information')),
          Container(
            color: greyColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Opacity(
                          opacity: 0.5, child: CustomText(text: 'Tel : ')),
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
                      const Opacity(
                          opacity: 0.5, child: CustomText(text: 'Email : ')),
                      CustomText(text: teamInfoModel?.baseInfo?.email ?? ''),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Opacity(
                          opacity: 0.5, child: CustomText(text: 'Address : ')),
                      CustomText(text: teamInfoModel?.baseInfo?.address ?? ''),
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
              color: greyColor.withOpacity(0.6),
              padding: EdgeInsets.all(5.w),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CustomText(text: 'Club Records'),
                   CustomText(text: 'Goals'),
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
                        padding: const EdgeInsets.only(top: 8.0,right: 8.0,bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 15.w,
                                  child: CustomText(
                                    textColor: index % 2 != 0? lightWhiteColor: cardColor,
                                      textAlign: TextAlign.right,
                                      text: "${index + 1}"),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: CachedNetworkImage(
                                    imageUrl: teamInfoModel?.teamRecord?[0]
                                            .trophyData?[index].personLogo ??
                                        '',
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        textColor: index % 2 != 0? Colors.white: Colors.black,
                                        text: teamInfoModel?.teamRecord?[0]
                                                .trophyData?[index].personName ??
                                            ''),
                                    Opacity(
                                      opacity: 0.6,
                                      child: CustomText(
                                          textColor: index % 2 != 0? Colors.white: Colors.black,
                                        size: 10.sp,
                                          text: teamInfoModel?.teamRecord?[0]
                                                  .trophyData?[index].birthDate ??
                                              ''),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CustomText(
                                textColor: index % 2 != 0? Colors.white: Colors.black,
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
              child: const CustomText(text: 'Trophies')),
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
                      height: 60.h,
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
                                  CachedNetworkImage(
                                    color: secondaryColor,
                                    width: 35.w,
                                    height: 35.h,
                                    imageUrl: teamInfoModel
                                            ?.trophyInfo?[index].trophyImg ??
                                        '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
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
