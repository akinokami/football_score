import 'package:flutter/material.dart';
import 'package:football_score/models/match_detail_model.dart';
import 'package:football_score/models/match_model.dart';
import 'package:football_score/models/overview_model.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../controller/match_detail_controller.dart';

class OverviewWidget extends StatelessWidget {
  final Matches? match;
  final MatchDetailModel? matchDetailModel;
  final List<Tendencies> tendencies;
  const OverviewWidget({super.key, this.match, this.matchDetailModel, required this.tendencies});

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
                      itemCount: tendencies.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               if(tendencies[index].teamAGoal!=null) CustomText(
                                  text: tendencies[index].teamAGoal?[index].minute ?? '',
                                  size: 12,
                                  textColor: Colors.white,
                                ),
                                kSizedBoxW10,
                                if(tendencies[index].teamAGoal!=null) CustomText(
                                  text: tendencies[index].teamAGoal?[index].person?.name ?? '',
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
