import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class OverviewWidget extends StatelessWidget {
  final Map<String, dynamic> overviewModel;
  const OverviewWidget({super.key, required this.overviewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          CustomText(text: 'statistics'),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      overviewModel['data'][1]['data']['statistics'].length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                            text: overviewModel['data'][1]['data']['statistics']
                                [index]['home_team_value']),
                        CustomText(
                            text: overviewModel['data'][1]['data']['statistics']
                                [index]['away_team_value']),
                      ],
                    );
                  })),
          kSizedBoxW30,
          CustomText(text: 'events'),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: overviewModel['data'][2]['data']['events'].length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                            text: overviewModel['data'][2]['data']['events']
                                [index]['minute']),
                        CustomText(
                            text: overviewModel['data'][2]['data']['events']
                                [index]['minute']),
                        CustomText(
                            text: overviewModel['data'][2]['data']['events']
                                [index]['minute']),
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
