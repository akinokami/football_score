import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_stats_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class StatsWidget extends StatelessWidget {
  final TeamStatsModel teamStatsModel;
  const StatsWidget({super.key, required this.teamStatsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomText(text: "${teamStatsModel.season?.rank ?? ''}"),
                CustomText(text: teamStatsModel.season?.name ?? '')
              ],
            ),
            Column(
              children: [
                CustomText(
                    text:
                        "${teamStatsModel.season?.matches?.win ?? ''}W ${teamStatsModel.season?.matches?.draw ?? ''}D ${teamStatsModel.season?.matches?.lose ?? ''}L"),
                CustomText(text: teamStatsModel.season?.matches?.name ?? '')
              ],
            ),
            Column(
              children: [
                CustomText(
                    text:
                        "${teamStatsModel.season?.fiveMatches?.win ?? ''}W ${teamStatsModel.season?.fiveMatches?.draw ?? ''}D ${teamStatsModel.season?.fiveMatches?.lose ?? ''}L"),
                CustomText(text: teamStatsModel.season?.fiveMatches?.name ?? '')
              ],
            )
          ],
        ),
        Container(
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
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Center(
                          child: Text(
                            '#',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                              fontSize: 10.sp,
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
                    itemCount: teamStatsModel.scoreBoard?.teams?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Table(
                        children: [
                          TableRow(children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Center(
                                  child: Text(
                                    teamStatsModel
                                            .scoreBoard?.teams?[index].rank ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: CachedNetworkImage(
                                  imageUrl: teamStatsModel
                                          .scoreBoard?.teams?[index].teamLogo ??
                                      '',
                                  width: 15.w,
                                  height: 15.w,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  teamStatsModel
                                          .scoreBoard?.teams?[index].clubName ??
                                      '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.sp,
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
                                    teamStatsModel.scoreBoard?.teams?[index]
                                            .matchesTotal ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    teamStatsModel.scoreBoard?.teams?[index]
                                            .matchesWon ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    teamStatsModel.scoreBoard?.teams?[index]
                                            .matchesDraw ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    teamStatsModel.scoreBoard?.teams?[index]
                                            .matchesLost ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    "${teamStatsModel.scoreBoard?.teams?[index].goalsPro ?? ''}-${teamStatsModel.scoreBoard?.teams?[index].goalsAgainst ?? ''}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    "${int.parse(teamStatsModel.scoreBoard?.teams?[index].goalsPro ?? '') - int.parse(
                                          teamStatsModel
                                                  .scoreBoard
                                                  ?.teams?[index]
                                                  .goalsAgainst ??
                                              '',
                                        )}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                    teamStatsModel
                                            .scoreBoard?.teams?[index].points ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
        ),
      ],
    );
  }
}
