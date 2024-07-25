import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';

import '../../widgets/custom_fast_cache_image.dart';

class StandingsWidget extends StatelessWidget {
  final Map<String, dynamic> rankingModel;
  const StandingsWidget({super.key, required this.rankingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Table(
            //border: TableBorder.all(color: Colors.white),
            children: const [
              TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'Team',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'W',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'D',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'L',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        '+/-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'GD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Text(
                        'Pts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
          Divider(
            color: cardColor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: rankingModel['data']['rankings'].length,
                itemBuilder: (context, index) {
                  return Table(
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(

                              child: Text(
                               "${ rankingModel['data']['rankings'][index]['rank']}"
                                    ,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child:
                  CustomFastCacheNetworkImage(
                  url: rankingModel['data']['rankings'][index]['team']['logo'],
                  width: 15,
                  height: 15)

                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Text(
                              "${ rankingModel['data']['rankings'][index]['team']['name']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                rankingModel['data']['rankings'][index]
                                    ['matches_total'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                rankingModel['data']['rankings'][index]
                                    ['matches_won'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                rankingModel['data']['rankings'][index]
                                    ['matches_draw'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                rankingModel['data']['rankings'][index]
                                    ['matches_lost'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                "${rankingModel['data']['rankings'][index]['goals_pro']}-${rankingModel['data']['rankings'][index]['goals_against']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                "${int.parse(rankingModel['data']['rankings'][index]['goals_pro']) - int.parse(rankingModel['data']['rankings'][index]['goals_against'])}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: Text(
                                rankingModel['data']['rankings'][index]
                                    ['points'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
