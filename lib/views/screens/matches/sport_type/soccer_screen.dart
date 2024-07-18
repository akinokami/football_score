import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';

class SoccerScreen extends StatelessWidget {
  const SoccerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          kSizedBoxH20,
          Card(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Team A",style: TextStyle(color: lightWhiteColor),),
                      Image.network("http://img-sd.allfootballapp.com/fastdfs6/M00/B1/43/rBUCgGKwRnOABJ9CAAAyVvOB41E222.png",width: 30,height: 30,),

                    ],
                  ),
                  Column(
                    children: [
                      Text("  1 - 0  ",style: TextStyle(color: lightWhiteColor),),
                      Text("  vs  ",style: TextStyle(color: lightWhiteColor),),
                      Text("  11:00 PM  ",style: TextStyle(color: lightWhiteColor,fontSize: 12),),
                    ],
                  ),
                  Row(
                    children: [
                      Image.network("https://sd.qunliao.info/fastdfs6/M00/9E/FE/rBUESWMRoGeANDfvAABExBoHIGE559.png",width: 30,height: 30,),
                      Text("Team B",style: TextStyle(color: lightWhiteColor),),

                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
