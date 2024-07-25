import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_member_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

class PlayerWidget extends StatelessWidget {
  final TeamMemberModel? teamMemberModel;
  const PlayerWidget({
    super.key,
    this.teamMemberModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: teamMemberModel?.memberList?.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBoxH20,
                  Container(
                    padding: EdgeInsets.all(5.w),
                    //margin: EdgeInsets.only(bottom: 5.h),
                    width: MediaQuery.of(context).size.width,
                    color: greyColor.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: index == 0
                                ? 'coach'.tr
                                : index == 1
                                    ? 'attacker'.tr
                                    : index == 2
                                        ? 'midfielder'.tr
                                        : index == 3
                                            ? 'defender'.tr
                                            : index == 4
                                                ? 'goalkeeper'.tr
                                                : 'Player'),
                        if (index != 0)
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: CustomText(
                                  text: 'apps'.tr,
                                  size: 10.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: CustomText(
                                  text: 'goals'.tr,
                                  size: 10.sp,
                                ),
                              ),
                              CustomText(
                                text: 'asists'.tr,
                                size: 10.sp,
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5.w),
                    color: greyColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: teamMemberModel
                          ?.memberList?[index].playerList?.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: FastCachedImage(
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.contain,
                                      url: teamMemberModel?.memberList?[index]
                                              .playerList?[index1].personLogo ??
                                          "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                      fadeInDuration:
                                          const Duration(seconds: 1),
                                      errorBuilder:
                                          (context, exception, stacktrace) {
                                        return Image.asset(
                                          "assets/images/football_news.webp",
                                          fit: BoxFit.contain,
                                          width: 30.w,
                                          height: 30.h,
                                        );
                                      },
                                      loadingBuilder: (context, progress) {
                                        debugPrint(
                                            'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                        return Container(
                                          width: 30.w,
                                          height: 30.h,
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
                                                    child: CircularProgressIndicator(
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
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        size: 11.sp,
                                        text: teamMemberModel
                                                ?.memberList?[index]
                                                .playerList?[index1]
                                                .personName ??
                                            '',
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: CustomText(
                                          text: index == 0
                                              ? "Age.${teamMemberModel?.memberList?[index].playerList?[index1].age ?? ''} ~ ${teamMemberModel?.memberList?[index].playerList?[index1].nationalityName ?? ''}"
                                              : "No.${teamMemberModel?.memberList?[index].playerList?[index1].shirtnumber ?? ''} ~ Age.${teamMemberModel?.memberList?[index].playerList?[index1].age ?? ''} ~ ${teamMemberModel?.memberList?[index].playerList?[index1].nationalityName ?? ''}",
                                          size: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: teamMemberModel
                                        ?.memberList?[index]
                                        .playerList?[index1]
                                        .statisticV1
                                        ?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index2) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.w, right: 12.w),
                                        child: Center(
                                          child: CustomText(
                                            text: teamMemberModel
                                                    ?.memberList?[index]
                                                    .playerList?[index1]
                                                    .statisticV1?[index2] ??
                                                '',
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
