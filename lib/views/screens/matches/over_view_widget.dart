import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

class OverviewWidget extends StatelessWidget {
  final Map<String, dynamic> statisticModel;
  final Map<String, dynamic> eventModel;
  const OverviewWidget(
      {super.key, required this.statisticModel, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: ListView(
          children: [
            kSizedBoxH10,
            Container(
                padding: const EdgeInsets.all(5),
                color: secondaryColor,
                child: CustomText(text: 'statistics'.tr)),
            kSizedBoxH10,
            statisticModel.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: const Center(
                      child: CustomText(
                        text: "No Statistic Data Found",
                      ),
                    ))
                : SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: statisticModel['data']['statistics'] != []
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                statisticModel['data']['statistics'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      child: CustomText(
                                          size: 8.sp,
                                          text: statisticModel['data']
                                                  ['statistics'][index]
                                              ['home_team_value']),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      height: 10.h,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.white,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.green),
                                        value: (statisticModel['data']
                                                            ['statistics']
                                                        [index]['name'] ==
                                                    'Attacks' ||
                                                statisticModel['data']
                                                            ['statistics']
                                                        [index]['name'] ==
                                                    'Dangerous Attacks')
                                            ? double.parse(statisticModel['data']['statistics'][index]['home_team_value']) /
                                                200
                                            : double.parse(statisticModel['data']
                                                        ['statistics'][index]
                                                    ['home_team_value']) /
                                                100,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: CustomText(
                                          maxLines: 2,
                                          size: 8.sp,
                                          textAlign: TextAlign.center,
                                          text: statisticModel['data']
                                              ['statistics'][index]['name']),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      height: 10.h,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.white,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.green),
                                        value: (statisticModel['data']
                                                            ['statistics']
                                                        [index]['name'] ==
                                                    'Attacks' ||
                                                statisticModel['data']
                                                            ['statistics']
                                                        [index]['name'] ==
                                                    'Dangerous Attacks')
                                            ? double.parse(statisticModel['data']['statistics'][index]['away_team_value']) /
                                                200
                                            : double.parse(statisticModel['data']
                                                        ['statistics'][index]
                                                    ['away_team_value']) /
                                                100,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                      child: CustomText(
                                          size: 8.sp,
                                          textAlign: TextAlign.end,
                                          text: statisticModel['data']
                                                  ['statistics'][index]
                                              ['away_team_value']),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : const Center(
                            child: CustomText(
                              text: "No Statistic Data Found",
                            ),
                          )),
            kSizedBoxW30,
            Container(
                padding: const EdgeInsets.all(5),
                color: secondaryColor,
                child: CustomText(text: 'events'.tr)),
            // if (eventModel['data']['events'] != null ||
            //     eventModel['data']['events'] != [])
            statisticModel.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: const Center(
                      child: CustomText(
                        text: "No Event Data Found",
                      ),
                    ))
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: eventModel['data']['events'] != []
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: eventModel['data']['events'].length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (eventModel['data']['events'][index]
                                              ['home'] !=
                                          [])
                                        SizedBox(
                                          height: eventModel['data']['events']
                                                          [index]['home']
                                                      .length >
                                                  2
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .12
                                              : eventModel['data']['events']
                                                              [index]['home']
                                                          .length ==
                                                      2
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .08
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .40,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: eventModel['data']
                                                      ['events'][index]['home']
                                                  .length,
                                              itemBuilder:
                                                  (context, homeIndex) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 1.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomText(
                                                              size: 8.sp,
                                                              text: eventModel[
                                                                              'data']
                                                                          [
                                                                          'events']
                                                                      [
                                                                      index]['home']
                                                                  [
                                                                  homeIndex]['minute']),
                                                          if (eventModel['data']['events']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'home']
                                                                      [
                                                                      homeIndex]
                                                                  [
                                                                  'minute_extra'] !=
                                                              "0")
                                                            CustomText(
                                                                size: 8.sp,
                                                                text:
                                                                    " +${eventModel['data']['events'][index]['home'][homeIndex]['minute_extra']}"),
                                                        ],
                                                      ),
                                                      kSizedBoxW10,
                                                      (eventModel['data']['events'][index]
                                                                          ['home']
                                                                      [homeIndex]
                                                                  ['code'] ==
                                                              "YC"||eventModel['data']['events'][index]
                                                      ['home']
                                                      [homeIndex]
                                                      ['code'] ==
                                                          "RC")
                                                          ? Container(
                                                              width: 4.w,
                                                              height: 6.h,
                                                              color:eventModel['data']['events'][index]
                                                              ['home']
                                                              [homeIndex]
                                                              ['code'] ==
                                                                  "YC"?
                                                                  Colors.yellow:Colors.red,
                                                            )
                                                          : (eventModel['data']['events'][index]['home'][homeIndex]['code'] ==
                                                                      "G" ||
                                                                  eventModel['data']['events'][index]['home'][homeIndex][
                                                                          'code'] ==
                                                                      "OG"||eventModel['data']['events'][index]['home'][homeIndex][
                                                      'code'] ==
                                                          "PG")
                                                              ? Icon(
                                                                  Icons
                                                                      .sports_soccer,
                                                                  color: eventModel['data']['events'][index]['home'][homeIndex]
                                                                              [
                                                                              'code'] ==
                                                                          "G"||eventModel['data']['events'][index]['home'][homeIndex]
                                                                  [
                                                                  'code'] ==
                                                                      "PG"
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .red,
                                                                  size: 12,
                                                                )
                                                              : (eventModel['data']['events'][index]['home'][homeIndex]
                                                                          ['code'] ==
                                                                      "SO"||eventModel['data']['events'][index]['home'][homeIndex]
                                                      ['code'] ==
                                                          "SI")
                                                                  ?  Icon(
                                                        eventModel['data']['events'][index]['home'][homeIndex]
                                                        ['code'] ==
                                                            "SO" ?Icons
                                                                          .arrow_forward:Icons.arrow_back,
                                                                      color:eventModel['data']['events'][index]['home'][homeIndex]
                                                                      ['code'] ==
                                                                          "SO"? Colors
                                                                          .red:Colors.green,
                                                                      size: 10,
                                                                    )
                                                                  : eventModel['data']['events'][index]['home'][homeIndex]
                                                      ['code'] ==
                                                          "VAR"?const Text("VAR",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize:
                                                                              8)):Image.asset("assets/images/assist.webp",width: 15,height: 15,),
                                                      kSizedBoxW10,
                                                      SizedBox(
                                                        width: 70.w,
                                                        child: CustomText(
                                                            //textColor: Colors.green,
                                                            maxLines: 2,
                                                            size: 8.sp,
                                                            textAlign:
                                                                TextAlign.left,
                                                            text: eventModel['data']
                                                                            [
                                                                            'events']
                                                                        [index][
                                                                    'home'][homeIndex]
                                                                [
                                                                'person']['name']),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      if (eventModel['data']['events'][index]
                                              ['away'] !=
                                          [])
                                        SizedBox(
                                          height: eventModel['data']['events']
                                                          [index]['away']
                                                      .length >
                                                  2
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .12
                                              : eventModel['data']['events']
                                                              [index]['away']
                                                          .length ==
                                                      2
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .08
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .40,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: eventModel['data']
                                                      ['events'][index]['away']
                                                  .length,
                                              itemBuilder:
                                                  (context, awayIndex) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 5.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (eventModel['data']['events']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'away']
                                                                  [awayIndex][
                                                              'minute_extra'] !=
                                                          "45")
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                                size: 8.sp,
                                                                text: eventModel['data']
                                                                            [
                                                                            'events']
                                                                        [
                                                                        index]['away']
                                                                    [
                                                                    awayIndex]['minute']),
                                                            if (eventModel['data']['events'][index]
                                                                            [
                                                                            'away']
                                                                        [
                                                                        awayIndex]
                                                                    [
                                                                    'minute_extra'] !=
                                                                "0")
                                                              CustomText(
                                                                  size: 8.sp,
                                                                  text:
                                                                      " +${eventModel['data']['events'][index]['away'][awayIndex]['minute_extra']}"),
                                                          ],
                                                        ),
                                                      if (eventModel['data']['events']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'away']
                                                                  [awayIndex][
                                                              'minute_extra'] !=
                                                          "45")
                                                        kSizedBoxW10,
                                                      if (eventModel['data']['events']
                                                                          [index]
                                                                      ['away']
                                                                  [awayIndex][
                                                              'minute_extra'] !=
                                                          "45")
                                                        (eventModel['data']['events']
                                                                            [index]
                                                                        ['away'][awayIndex]
                                                                    ['code'] ==
                                                                "YC"||eventModel['data']['events'][index]
                                                        ['away']
                                                            [awayIndex]
                                                            ['code'] ==
                                                            "RC")
                                                            ? Container(
                                                                width: 4.w,
                                                                height: 6.h,
                                                                color:eventModel['data']['events']
                                                                [index]
                                                                ['away'][awayIndex]
                                                                ['code'] ==
                                                                    "YC"? Colors
                                                                    .yellow:Colors.red,
                                                              )
                                                            :(eventModel['data']['events'][index]['away'][awayIndex]['code'] ==
                                                            "G" ||
                                                            eventModel['data']['events'][index]['away'][awayIndex][
                                                            'code'] ==
                                                                "OG"||eventModel['data']['events'][index]['away'][awayIndex][
                                                        'code'] ==
                                                            "PG")
                                                            ? Icon(
                                                          Icons
                                                              .sports_soccer,
                                                          color: eventModel['data']['events'][index]['away'][awayIndex]
                                                          [
                                                          'code'] ==
                                                              "G" ||eventModel['data']['events'][index]['away'][awayIndex]
                                                          [
                                                          'code'] ==
                                                              "PG"

                                                              ? Colors
                                                              .green
                                                              : Colors
                                                              .red,
                                                          size: 12,
                                                        ): (eventModel['data']['events'][index]['away'][awayIndex]
                                                    ['code'] ==
                                                    "SO"||eventModel['data']['events'][index]['away'][awayIndex]
                                                    ['code'] ==
                                                    "SI")
                                                    ?  Icon(
                                                    eventModel['data']['events'][index]['away'][awayIndex]
                                                    ['code'] ==
                                                    "SO" ?Icons
                                                        .arrow_forward:Icons.arrow_back,
                                                    color:eventModel['data']['events'][index]['away'][awayIndex]
                                                    ['code'] ==
                                                    "SO"? Colors
                                                        .red:Colors.green,
                                                    size: 10,
                                                    )
                                                        : eventModel['data']['events'][index]['away'][awayIndex]
                                                    ['code'] ==
                                                    "VAR"?const Text("VAR",
                                                    style: TextStyle(
                                                    color: Colors
                                                        .red,
                                                    fontSize:
                                                    8)):Image.asset("assets/images/assist.webp",width: 15,height: 15,),
                                                      if (eventModel['data']['events']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'away']
                                                                  [awayIndex][
                                                              'minute_extra'] !=
                                                          "45")
                                                        kSizedBoxW10,
                                                      if (eventModel['data']['events']
                                                                          [index]
                                                                      ['away']
                                                                  [awayIndex][
                                                              'minute_extra'] !=
                                                          "45")
                                                        SizedBox(
                                                          width: 70.w,
                                                          child: CustomText(
                                                              //textColor: Colors.green,
                                                            maxLines: 2,
                                                              size: 8.sp,
                                                              textAlign: TextAlign
                                                                  .right,
                                                              text: eventModel['data']
                                                                              ['events']
                                                                          [index]['away']
                                                                      [awayIndex][
                                                                  'person']['name']),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        )
                                    ],
                                  ),
                                  if ((eventModel['data']['events'][index]
                                          ['minute_extra'] ==
                                      "45"))
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .40,
                                            child: Divider(
                                              color: lightWhiteColor,
                                            ),
                                          ),
                                          CustomText(
                                              size: 8.sp, text: 'Half Time'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .40,
                                            child: Divider(
                                              color: lightWhiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (index ==
                                      eventModel['data']['events'].length - 1)
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .40,
                                            child: Divider(
                                              color: lightWhiteColor,
                                            ),
                                          ),
                                          CustomText(
                                              size: 8.sp, text: 'Full Time'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .40,
                                            child: Divider(
                                              color: lightWhiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            })
                        : const Center(
                            child: CustomText(
                              text: "No Event Data Found",
                            ),
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
