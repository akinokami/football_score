import 'package:flutter/material.dart';
import 'package:football_score/models/overview_model.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class OverviewWidget extends StatelessWidget {
  final OverviewModel overviewModel;
  const OverviewWidget({super.key, required this.overviewModel});

  @override
  Widget build(BuildContext context) {
    print("overview>>> ${overviewModel.overviews?.tendencies?.length}");
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
                      itemCount: overviewModel.overviews?.tendencies?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (overviewModel.overviews?.tendencies?[index]
                                    .teamAGoal !=
                                    null)
                                  CustomText(
                                    text: overviewModel
                                        .overviews
                                        ?.tendencies?[index]
                                        .teamAGoal?[index]
                                        .minute ??
                                        '',
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                                kSizedBoxW10,
                                if (overviewModel.overviews?.tendencies?[index]
                                    .teamAGoal !=
                                    null)
                                  CustomText(
                                    text: overviewModel
                                        .overviews
                                        ?.tendencies?[index]
                                        .teamAGoal?[index]
                                        .person
                                        ?.name ??
                                        '',
                                    size: 12,
                                    textColor: Colors.white,
                                  ),
                              ],
                            ),
                          ],
                        );
                      })),
              kSizedBoxW30,
              // Expanded(
              //     child: ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: tendencies.length,
              //         itemBuilder: (context, index) {
              //           return Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   if (tendencies[index].teamBGoal != null)
              //                     CustomText(
              //                       text: tendencies[index]
              //                               .teamBGoal?[index]
              //                               .minute ??
              //                           '',
              //                       size: 12,
              //                       textColor: Colors.white,
              //                     ),
              //                   kSizedBoxW10,
              //                   if (tendencies[index].teamBGoal != null)
              //                     CustomText(
              //                       text: tendencies[index]
              //                               .teamBGoal?[index]
              //                               .person
              //                               ?.name ??
              //                           '',
              //                       size: 12,
              //                       textColor: Colors.white,
              //                     ),
              //                 ],
              //               ),
              //             ],
              //           );
              //         })),
            ],
          ),
        ],
      ),
    );
  }
}