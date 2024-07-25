import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/team_stats_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/views/widgets/custom_text.dart';

class StatsWidget extends StatelessWidget {
  final TeamStatsModel teamStatsModel;
  final String teamName;
  const StatsWidget({super.key, required this.teamStatsModel, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         decoration: BoxDecoration(
            color: greyColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(2.r),
          ),
          margin: EdgeInsets.all(10.w),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(size:10.sp,text: "${teamStatsModel.season?.rank ?? ''}"),
                  CustomText(size:10.sp,text: teamStatsModel.season?.name ?? '')
                ],
              ),
              Column(
                children: [
                  CustomText(size:10.sp,
                      text:
                          "${teamStatsModel.season?.matches?.win ?? ''}W ${teamStatsModel.season?.matches?.draw ?? ''}D ${teamStatsModel.season?.matches?.lose ?? ''}L"),
                  CustomText(size:10.sp,text: teamStatsModel.season?.matches?.name ?? '')
                ],
              ),
              Column(
                children: [
                  CustomText(size:10.sp,
                      text:
                          "${teamStatsModel.season?.fiveMatches?.win ?? ''}W ${teamStatsModel.season?.fiveMatches?.draw ?? ''}D ${teamStatsModel.season?.fiveMatches?.lose ?? ''}L"),
                  CustomText(size:10.sp,text: teamStatsModel.season?.fiveMatches?.name ?? '')
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(3.r),
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                child:
                                FastCachedImage(
                                  width: 15.w,
                                  height: 15.h,
                                  fit: BoxFit.contain,
                                  url: teamStatsModel
                                      .scoreBoard?.teams?[index].teamLogo ??
                                      "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                  fadeInDuration: const Duration(seconds: 1),
                                  errorBuilder: (context, exception, stacktrace) {
                                    return Image.asset(
                                      "assets/images/football_news.webp",
                                      fit: BoxFit.contain,
                                      width: 15.w,
                                      height: 15.h,
                                    );
                                  },
                                  loadingBuilder: (context, progress) {
                                    debugPrint(
                                        'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                    return Container(
                                      width: 15.w,
                                      height: 15.h,
                                      color: secondaryColor,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          if (progress.isDownloading &&
                                              progress.totalBytes != null)
                                            Text(
                                                '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                style: const TextStyle(color: Colors.red)),
                                          Center(
                                            child: SizedBox(
                                                width: 10,
                                                height: 10,
                                                child: CircularProgressIndicator(
                                                    color: Colors.white,
                                                    value: progress.progressPercentage.value)),
                                          ),
                                        ],
                                      ),
                                    );
                                    // return Center(
                                    //   child: CircularProgressIndicator(),
                                    // );
                                  },
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
                                    color:teamName== teamStatsModel
                                        .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
                                    fontSize: 7.sp,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
                                      color:teamName== teamStatsModel
                                          .scoreBoard?.teams?[index].clubName?secondaryColor: Colors.white,
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
