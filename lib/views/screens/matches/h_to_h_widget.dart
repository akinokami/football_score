import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/preview_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class HToHWidget extends StatelessWidget {
  final PreviewModel? previewModel;
  const HToHWidget({super.key, this.previewModel});

  @override
  Widget build(BuildContext context) {
    return (previewModel?.preData?.matches?.isNotEmpty == true)
        ? Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: previewModel?.preData?.matches?.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.w),
                  child: Card(
                    color: cardColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: CustomText(
                            fontWeight: FontWeight.bold,
                            size: 10.sp,
                            text: DateFormat('d MMM yyyy, h:mm a').format(
                              DateTime.parse(
                                previewModel
                                        ?.preData?.matches?[index].startTime ??
                                    '',
                              ),
                            ),
                          ),
                        ),
                        kSizedBoxH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: CustomText(
                                      text: previewModel
                                              ?.preData
                                              ?.matches?[index]
                                              .homeTeam
                                              ?.name ??
                                          '',
                                      maxLines: 2,
                                      size: 10.sp,
                                    ),
                                  ),
                                  kSizedBoxW10,
                                  CachedNetworkImage(
                                    width: 20.w,
                                    height: 20.h,
                                    imageUrl: previewModel?.preData
                                            ?.matches?[index].homeTeam?.logo ??
                                        '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ],
                              ),
                            ),
                            CustomText(
                                text:
                                    "${previewModel?.preData?.matches?[index].homeScore ?? ''} - ${previewModel?.preData?.matches?[index].awayScore ?? ''}"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    width: 20.w,
                                    height: 20.h,
                                    imageUrl: previewModel?.preData
                                            ?.matches?[index].awayTeam?.logo ??
                                        '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  kSizedBoxW10,
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: CustomText(
                                      text: previewModel
                                              ?.preData
                                              ?.matches?[index]
                                              .awayTeam
                                              ?.name ??
                                          '',
                                      maxLines: 2,
                                      size: 10.sp,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        kSizedBoxH10
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        : const Center(
            child: CustomText(
              text: "No Data Found",
            ),
          );
  }
}
