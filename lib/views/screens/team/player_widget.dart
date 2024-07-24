import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_member_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';

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
                    width:MediaQuery.of(context).size.width,
                    color: greyColor.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: index == 0
                                ? 'Coach'
                                : index == 1
                                    ? 'Attacker'
                                    : index == 2
                                        ? 'Midfielder'
                                        : index == 3
                                            ? 'Defender'
                                            : index == 4
                                                ? 'Goalkeeper'
                                                : 'Player'),
                       if(index != 0
                           ) Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: CustomText(
                                text: 'Apps',
                                size: 10.sp,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: CustomText(
                                text: 'Goals',
                                size: 10.sp,
                              ),
                            ),
                            CustomText(
                              text: 'Asists',
                              size: 10.sp,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width,
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
                                    child: CachedNetworkImage(
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.cover,
                                      imageUrl: teamMemberModel
                                              ?.memberList?[index]
                                              .playerList?[index1]
                                              .personLogo ??
                                          '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
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
                                          text:
                                              "No.${teamMemberModel?.memberList?[index].playerList?[index1].shirtnumber ?? ''} ~ Age.${teamMemberModel?.memberList?[index].playerList?[index1].age ?? ''} ~ ${teamMemberModel?.memberList?[index].playerList?[index1].nationalityName ?? ''}",
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