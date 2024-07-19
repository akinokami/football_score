import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/models/preview_model.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class HToHWidget extends StatelessWidget {
  final PreviewModel? previewModel;
  const HToHWidget({super.key, this.previewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: previewModel?.preData?.matches?.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text:
                        previewModel?.preData?.matches?[index].startTime ?? ''),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                        text: previewModel
                                ?.preData?.matches?[index].homeTeam?.name ??
                            ''),
                    CachedNetworkImage(
                      width: 20,
                      height: 20,
                      imageUrl: previewModel
                              ?.preData?.matches?[index].homeTeam?.logo ??
                          '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    CustomText(
                        text:
                            "${previewModel?.preData?.matches?[index].homeScore ?? ''} - ${previewModel?.preData?.matches?[index].awayScore ?? ''}"),
                    CachedNetworkImage(
                      width: 20,
                      height: 20,
                      imageUrl: previewModel
                              ?.preData?.matches?[index].awayTeam?.logo ??
                          '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    CustomText(
                        text: previewModel
                                ?.preData?.matches?[index].awayTeam?.name ??
                            '')
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
