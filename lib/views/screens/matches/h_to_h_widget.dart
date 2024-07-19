import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: previewModel?.preData?.matches?.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              color: cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      size: 14,
                      text: DateFormat('d MMM yyyy, h:mm a').format(
                        DateTime.parse(
                          previewModel?.preData?.matches?[index].startTime ??
                              '',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                  previewModel?.preData?.matches?[index]
                                          .homeTeam?.name ??
                                      '',
                                  style: TextStyle(color: whiteColor)),
                            ),
                            kSizedBoxW10,
                            CachedNetworkImage(
                              width: 20,
                              height: 20,
                              imageUrl: previewModel?.preData?.matches?[index]
                                      .homeTeam?.logo ??
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
                              width: 20,
                              height: 20,
                              imageUrl: previewModel?.preData?.matches?[index]
                                      .awayTeam?.logo ??
                                  '',
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            kSizedBoxW10,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                  previewModel?.preData?.matches?[index]
                                          .awayTeam?.name ??
                                      '',
                                  style: TextStyle(color: whiteColor)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
