import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

class OverviewWidget extends StatelessWidget {
  final Map<String, dynamic> overviewModel;
  const OverviewWidget({super.key, required this.overviewModel});

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
            if(overviewModel['data'][1]['data']['statistics']!=null||overviewModel['data'][1]['data']['statistics']!=[]) SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        overviewModel['data'][1]['data']['statistics'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20.w,
                              child: CustomText(
                                  size: 8.sp,
                                  text: overviewModel['data'][1]['data']
                                      ['statistics'][index]['home_team_value']),
                            ),
                            SizedBox(
                              width: 80.w,
                              height: 10.h,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                value:(overviewModel['data'][1]['data']
                        ['statistics'][index]['name']=='Attacks' ||overviewModel['data'][1]['data']
                                ['statistics'][index]['name']=='Dangerous Attacks')?double.parse(overviewModel['data'][1]['data']['statistics'][index]['home_team_value'])/200: double.parse(overviewModel['data'][1]['data']['statistics'][index]['home_team_value'])/100,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: CustomText(
                                  maxLines: 2,
                                  size: 8.sp,
                                  textAlign: TextAlign.center,
                                  text: overviewModel['data'][1]['data']
                                      ['statistics'][index]['name']),
                            ),
                            SizedBox(
                              width: 80.w,
                              height: 10.h,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                value: (overviewModel['data'][1]['data']
                                ['statistics'][index]['name']=='Attacks' ||overviewModel['data'][1]['data']
                                ['statistics'][index]['name']=='Dangerous Attacks')?double.parse(overviewModel['data'][1]['data']['statistics'][index]['away_team_value'])/200: double.parse(overviewModel['data'][1]['data']['statistics'][index]['away_team_value'])/100,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                              child: CustomText(
                                size: 8.sp,
                                  textAlign: TextAlign.end,
                                  text: overviewModel['data'][1]['data']
                                      ['statistics'][index]['away_team_value']),
                            ),
                          ],
                        ),
                      );
                    })),
            kSizedBoxW30,
            Container(
                padding: const EdgeInsets.all(5),
                color: secondaryColor,
                child: CustomText(text: 'events'.tr)),
           if(overviewModel['data']!=null||overviewModel['data']!=[]) SizedBox(
                height: MediaQuery.of(context).size.height * 8,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        overviewModel['data'][2]['data']['events'].length,
                    itemBuilder: (context, index) {


                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
if(overviewModel['data'][2]['data']['events'][index]['home']!=[])
  SizedBox(
  height:overviewModel['data'][2]['data']['events'][index]['home'].length>2?MediaQuery.of(context).size.height * .12:overviewModel['data'][2]['data']['events'][index]['home'].length==2?MediaQuery.of(context).size.height * .08: MediaQuery.of(context).size.height * .02,
  width: MediaQuery.of(context).size.width * .40,
  child: ListView.builder(
    physics:  const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: overviewModel['data'][2]['data']['events'][index]['home'].length,
      itemBuilder: (context,homeIndex){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  size: 8.sp,
                  text: overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['minute']),
            if(overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['minute_extra']!="0")  CustomText(
                  size: 8.sp,
                  text: " +${overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['minute_extra']}"),
            ],
          ),
          kSizedBoxW10,
          (overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['code']=="YC")?
          Container(
            width: 4.w,
            height: 6.h,
            color: Colors.yellow,
          ):(overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['code']=="G"||overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['code']=="OG")? Icon(Icons.sports_soccer,color: overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['code']=="G"?Colors.green:Colors.red,size: 12,) : (overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['code']=="SO")?
          const Icon(Icons.arrow_forward,color: Colors.red,size: 10,):const Icon(Icons.arrow_back,color: Colors.green,size: 10,),
          kSizedBoxW10,
          CustomText(
            //textColor: Colors.green,
              size: 8.sp,
              textAlign: TextAlign.center,
              text: overviewModel['data'][2]['data']['events'][index]['home'][homeIndex]['person']['name']),
        ],
      ),
    );

  }),
),

                              if(overviewModel['data'][2]['data']['events'][index]['away']!=[])SizedBox(
                                height:overviewModel['data'][2]['data']['events'][index]['away'].length>2?MediaQuery.of(context).size.height * .12:overviewModel['data'][2]['data']['events'][index]['away'].length==2?MediaQuery.of(context).size.height * .08:  MediaQuery.of(context).size.height * .02,
                                width: MediaQuery.of(context).size.width * .40,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: overviewModel['data'][2]['data']['events'][index]['away'].length,
                                    itemBuilder: (context,awayIndex){
                                      return Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                           if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="45") Row(
                                             children: [
                                               CustomText(
                                                    size: 8.sp,
                                                    text: overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute']),
                                               if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="0")  CustomText(
                                                   size: 8.sp,
                                                   text: " +${overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']}"),
                                             ],
                                           ),
                                            if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="45") kSizedBoxW10,
                                            if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="45")
                                              (overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['code']=="YC")?
                                                  Container(
                                                    width: 4.w,
                                                    height: 6.h,
                                                    color: Colors.yellow,
                                                  ):
                                              (overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['code']=="SO")?
                                              const Icon(Icons.arrow_forward,color: Colors.red,size: 10,):const Icon(Icons.arrow_back,color: Colors.green,size: 10,),
                                            if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="45") kSizedBoxW10,
                                            if(overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['minute_extra']!="45")  CustomText(
                                                //textColor: Colors.green,
                                                size: 8.sp,
                                                textAlign: TextAlign.center,
                                                text: overviewModel['data'][2]['data']['events'][index]['away'][awayIndex]['person']['name']),
                                          ],
                                        ),
                                      );

                                    }),
                              )
                            ],
                          ),
                          if((overviewModel['data'][2]['data']['events'][index]['minute_extra']=="45"))
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width ,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .40,
                                    child: Divider(

                                      color:lightWhiteColor,),
                                  ),
                                  CustomText(
                                      size: 8.sp,
                                      text: 'Half Time'),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .40,
                                    child: Divider(

                                      color:lightWhiteColor,),
                                  ),
                                ],
                              ),
                            ),
                          if(index==overviewModel['data'][2]['data']['events'].length-1)
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width ,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .40,
                                    child: Divider(

                                      color:lightWhiteColor,),
                                  ),
                                  CustomText(
                                      size: 8.sp,
                                      text: 'Full Time'),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .40,
                                    child: Divider(

                                      color:lightWhiteColor,),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
