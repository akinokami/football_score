import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                    return Column(
                      children: [
                        CachedNetworkImage(
                          width: 20,
                          height: 20,
                          imageUrl: lineupModel?.lupList?[0].lupData!.home!
                                  .start![index].person?.logo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        CustomText(
                          text: lineupModel?.lupList?[0].lupData!.home!
                                  .start![index].person?.name ??
                              '',
                          size: 10,
                          textColor: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      lineupModel?.lupList?[0].lupData?.home?.start?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CachedNetworkImage(
                          width: 20,
                          height: 20,
                          imageUrl: lineupModel?.lupList?[0].lupData?.home
                                  ?.start?[index].person?.logo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        CustomText(
                          text: lineupModel?.lupList?[0].lupData?.home
                                  ?.start![index].person?.name ??
                              '',
                          size: 10,
                          textColor: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
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
                    return Column(
                      children: [
                        CachedNetworkImage(
                          width: 20,
                          height: 20,
                          imageUrl: lineupModel?.lupList?[0].lupData?.home
                                  ?.start![index].person?.logo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        CustomText(
                          text: lineupModel?.lupList?[0].lupData?.home
                                  ?.start![index].person?.name ??
                              '',
                          size: 10,
                          textColor: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      lineupModel?.lupList?[0].lupData?.home?.start?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CachedNetworkImage(
                          width: 20,
                          height: 20,
                          imageUrl: lineupModel?.lupList?[0].lupData?.home
                                  ?.start?[index].person?.logo ??
                              '',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        CustomText(
                          text: lineupModel?.lupList?[0].lupData?.home
                                  ?.start?[index].person?.name ??
                              '',
                          size: 10,
                          textColor: Colors.white,
                        ),
                      ],
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
