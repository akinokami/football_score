import 'package:flutter/material.dart';
import 'package:football_score/models/match_detail_model.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class OverviewWidget extends StatelessWidget {
  final Matches? match;
  final MatchDetailModel? matchDetailModel;
  const OverviewWidget({super.key, this.match, this.matchDetailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: match?.events?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (matchDetailModel?.matchSample?.teamAId ==
                                    match?.events?[index].teamId)
                                  CustomText(
                                    text:
                                        match?.events?[index].personName ?? '',
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                                kSizedBoxW10,
                                if (matchDetailModel?.matchSample?.teamAId ==
                                    match?.events?[index].teamId)
                                  CustomText(
                                    text:
                                        "${match?.events?[index].minute ?? ''}' ${match?.events?[index].code ?? ''}",
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                              ],
                            ),
                          ],
                        );
                      })),
              kSizedBoxW30,
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: match?.events?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (matchDetailModel?.matchSample?.teamBId ==
                                    match?.events?[index].teamId)
                                  CustomText(
                                    text:
                                        match?.events?[index].personName ?? '',
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                                kSizedBoxW10,
                                if (matchDetailModel?.matchSample?.teamBId ==
                                    match?.events?[index].teamId)
                                  CustomText(
                                    text:
                                        "${match?.events?[index].minute ?? ''}' ${match?.events?[index].code ?? ''}",
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                              ],
                            ),
                          ],
                        );
                      }))
            ],
          ),
        ],
      ),
    );
  }
}
