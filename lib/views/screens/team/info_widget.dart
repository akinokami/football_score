import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_info_model.dart';

import '../../widgets/custom_text.dart';

class InfoWidget extends StatelessWidget {
  final TeamInfoModel? teamInfoModel;
  const InfoWidget({
    super.key,
    this.teamInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Info'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Founded in :'),
                CustomText(text: teamInfoModel?.baseInfo?.founded ?? ''),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Location :'),
                CustomText(
                    text:
                        "${teamInfoModel?.baseInfo?.country ?? ''}, ${teamInfoModel?.baseInfo?.city ?? ''}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Home :'),
                CustomText(
                    text:
                        "${teamInfoModel?.baseInfo?.venueName ?? ''}, Capacity ${teamInfoModel?.baseInfo?.venueCapacity ?? ''}"),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(text: 'Contact Information'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Tel :'),
                CustomText(text: teamInfoModel?.baseInfo?.telephone ?? ''),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Email :'),
                CustomText(text: teamInfoModel?.baseInfo?.email ?? ''),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Address :'),
                CustomText(text: teamInfoModel?.baseInfo?.address ?? ''),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(text: 'Trophies'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: teamInfoModel?.trophyInfo?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                            teamInfoModel?.trophyInfo?[index].competitionName ??
                                ''),
                    SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              teamInfoModel?.trophyInfo?[index].lists?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
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
                                CustomText(
                                    text: teamInfoModel?.trophyInfo?[index]
                                            .lists?[i].seasonName ??
                                        ''),
                              ],
                            );
                          }),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
