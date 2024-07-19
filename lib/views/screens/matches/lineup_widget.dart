import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';

import '../../../models/lineup_model.dart';

class LineupWidget extends StatelessWidget {
  final LineupModel? lineupModel;
  const LineupWidget({
    super.key,
    required this.lineupModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomText(text: 'Starts'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      lineupModel?.lupList?[0].lupData?.home?.start?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          CustomText(
                            textAlign: TextAlign.end,
                            text: lineupModel?.lupList?[0].lupData!.home!
                                    .start![index].person?.name ??
                                '',
                            size: 10,
                            textColor: Colors.white,
                          ),
                          kSizedBoxW10,
                          CachedNetworkImage(
                            width: 30,
                            height: 30,
                            imageUrl: lineupModel?.lupList?[0].lupData!.home!
                                .start![index].person?.logo ??
                                '',
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      lineupModel?.lupList?[0].lupData?.away?.start?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          kSizedBoxW20,
                          CachedNetworkImage(
                            width: 30,
                            height: 30,
                            imageUrl: lineupModel?.lupList?[0].lupData?.away
                                    ?.start?[index].person?.logo ??
                                '',
                            placeholder: (context, url) =>
                                const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          kSizedBoxW10,
                          CustomText(
                            text: lineupModel?.lupList?[0].lupData?.away
                                    ?.start![index].person?.name ??
                                '',
                            size: 10,
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
          Divider(color: lightWhiteColor,),
          if((lineupModel?.lupList?[0].lupData?.home?.sub?.length??0)>0) const CustomText(text: 'Substitutes'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                  lineupModel?.lupList?[0].lupData?.home?.sub?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          CustomText(
                            textAlign: TextAlign.end,
                            text: lineupModel?.lupList?[0].lupData!.home!
                                .sub![index].person?.name ??
                                '',
                            size: 10,
                            textColor: Colors.white,
                          ),
                          kSizedBoxW10,
                          CachedNetworkImage(
                            width: 30,
                            height: 30,
                            imageUrl: lineupModel?.lupList?[0].lupData!.home!
                                .sub![index].person?.logo ??
                                '',
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                  lineupModel?.lupList?[0].lupData?.away?.sub?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          kSizedBoxW20,
                          CachedNetworkImage(
                            width: 30,
                            height: 30,
                            imageUrl: lineupModel?.lupList?[0].lupData?.away
                                ?.sub?[index].person?.logo ??
                                '',
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                          kSizedBoxW10,
                          CustomText(
                            text: lineupModel?.lupList?[0].lupData?.away
                                ?.sub![index].person?.name ??
                                '',
                            size: 10,
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
