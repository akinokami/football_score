import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
class StandingModel{
  final String? teamName;
  final int? played;
  final int? won;
  final int? draw;
  final int? lost;
  final int? goalDifference;
  final int? goalFor;
  final int? goalAgainst;
  final int? points;

  StandingModel({
    this.teamName,
    this.played,
    this.won,
    this.draw,
    this.lost,
    this.goalDifference,
    this.goalFor,
    this.goalAgainst,
    this.points,
  });

}
class StandingsWidget extends StatelessWidget {
  const StandingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<StandingModel> standingList=[
      StandingModel(
        teamName: 'Chelsea',
        played: 10,
        won: 5,
        draw: 3,
        lost: 2,
        goalDifference: 10,
        goalFor: 20,
        goalAgainst: 10,
        points: 18,
      ),
      StandingModel(
        teamName: 'Arsenal',
        played: 10,
        won: 5,
        draw: 3,
        lost: 2,
        goalDifference: 10,
        goalFor: 20,
        goalAgainst: 10,
        points: 18,
      ),
      StandingModel(
        teamName: 'Manchester City',
        played: 10,
        won: 5,
        draw: 3,
        lost: 2,
        goalDifference: 10,
        goalFor: 20,
        goalAgainst: 10,
        points: 18,
      ),

    ];
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Table(
            //border: TableBorder.all(color: Colors.white),
            children: const [
              TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
                    padding: EdgeInsets.all(5.0),
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
            height: MediaQuery.of(context).size.height *.2,
            child: ListView.builder(

              scrollDirection: Axis.vertical,
                itemCount: standingList.length,
                itemBuilder: (context,index){
                print("${standingList[index].teamName}");
              return Table(
                //border: TableBorder.all(color: Colors.white),
                children:  [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          standingList[index].teamName??"",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].played}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].won}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].draw}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].lost}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].goalFor}-${standingList[index].goalAgainst}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].goalDifference}",
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
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "${standingList[index].points}",
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
