import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/team_detail_controller.dart';
import 'package:football_score/models/team_fix_model.dart';
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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          if (teamDetailController.seasonList.isNotEmpty)
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              child: DropdownButtonHideUnderline(
                child: Obx(() => DropdownButton<SeasonList>(
                      padding: const EdgeInsets.only(left: 8),
                      value: teamDetailController.selectedSeason.value,
                      hint: const CustomText(
                        text: 'Select Season',
                        textColor: Colors.white,
                      ),
                      style: const TextStyle(color: Colors.white),
                      items: teamDetailController.seasonList
                          .map<DropdownMenuItem<SeasonList>>(
                              (SeasonList? value) {
                        return DropdownMenuItem<SeasonList>(
                          value: value,
                          child: CustomText(
                            text: value?.name,
                            textColor: Colors.black,
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
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: teamFixModel?.matchList?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: DateFormat('dd-MMM-yyyy, hh:mm a')
                                            .format(DateTime.parse(teamFixModel
                                                    ?.matchList?[index]
                                                    .startPlay ??
                                                '')),
                                        size: 10.sp,
                                      ),
                                      CustomText(
                                        text: teamFixModel?.matchList?[index]
                                                .competitionName ??
                                            '',
                                        size: 10.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 45.w,
                                              child: CustomText(
                                                text: teamFixModel
                                                        ?.matchList?[index]
                                                        .teamAName ??
                                                    '',
                                                size: 10.sp,
                                                maxLines: 2,
                                              ),
                                            ),
                                            CachedNetworkImage(
                                              width: 20.w,
                                              height: 20.h,
                                              imageUrl: teamFixModel
                                                      ?.matchList?[index]
                                                      .teamALogo ??
                                                  '',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            CustomText(
                                              text:
                                                  "${teamFixModel?.matchList?[index].fsA ?? ''} - ${teamFixModel?.matchList?[index].fsB ?? ''}",
                                            ),
                                            CachedNetworkImage(
                                              width: 20.w,
                                              height: 20.h,
                                              imageUrl: teamFixModel
                                                      ?.matchList?[index]
                                                      .teamBLogo ??
                                                  '',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            SizedBox(
                                              width: 45.w,
                                              child: CustomText(
                                                text: teamFixModel
                                                        ?.matchList?[index]
                                                        .teamBName ??
                                                    '',
                                                size: 10.sp,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
            ),
          )
        ],
      ),
    );
  }
}
