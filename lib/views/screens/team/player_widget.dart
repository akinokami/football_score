import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_member_model.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class PlayerWidget extends StatelessWidget {
  final TeamMemberModel? teamMemberModel;
  const PlayerWidget({
    super.key,
    this.teamMemberModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: teamMemberModel?.memberList?.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                          Row(
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
                      ListView.builder(
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
                                    CachedNetworkImage(
                                      width: 40.w,
                                      height: 40.h,
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
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: teamMemberModel
                                                  ?.memberList?[index]
                                                  .playerList?[index1]
                                                  .personName ??
                                              '',
                                        ),
                                        CustomText(
                                          text:
                                              "No.${teamMemberModel?.memberList?[index].playerList?[index1].shirtnumber ?? ''} ~ Age.${teamMemberModel?.memberList?[index].playerList?[index1].age ?? ''} ~ ${teamMemberModel?.memberList?[index].playerList?[index1].nationalityName ?? ''}",
                                          size: 10.sp,
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
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
