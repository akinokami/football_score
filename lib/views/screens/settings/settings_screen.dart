import 'package:flutter/material.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/privacy_policy_screen.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../change_language.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //iconTheme: IconThemeData(color: lightWhiteColor),
          backgroundColor: primaryColor,
          title:  Text('Settings',style: TextStyle(color: lightWhiteColor) ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
          Text('General',style: TextStyle(color: lightWhiteColor,fontSize: 16,fontWeight: FontWeight.bold)),

         GestureDetector(
            onTap: (){
              Get.to(const ChangeLanguageScreen());
            },
           child: Card(
             color: cardColor,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/chnage_lan.webp",width: 20,height: 30,),
                        kSizedBoxW10,
                        Text('Language',style: TextStyle(color: lightWhiteColor,fontSize: 14)),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Text("English",style: TextStyle(color: lightWhiteColor,fontSize: 14)),
                      Icon(Icons.arrow_forward_ios,color: lightWhiteColor,size: 20,),
                    ],
                  ),
               ],
             )


           ),
         ),
          kSizedBoxH20,
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Divider(color: lightWhiteColor,),
          // ),
          Text('Other',style: TextStyle(color: lightWhiteColor,fontSize: 16,fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: (){
                Get.to(const PrivacyPolicyScreen());
              },
              child: Card(
                color: cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(Icons.privacy_tip_outlined,color: lightWhiteColor,size: 20,),
                          kSizedBoxW10,
                          Text('Privacy Policy',style: TextStyle(color: lightWhiteColor,fontSize: 14)),
                        ],
                      ),
                    ),

                    Icon(Icons.arrow_forward_ios,color: lightWhiteColor,size: 20,),
                  ],
                )
              ),
            ),
            kSizedBoxH10,
            Card(
                color: cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(Icons.info_outlined,color: lightWhiteColor,size: 20,),
                          kSizedBoxW10,
                          Text('Version',style: TextStyle(color: lightWhiteColor,fontSize: 14)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
                      child: Text(appVersion,style: TextStyle(color: lightWhiteColor,fontSize: 14)),
                    ),
                  ],
                )
            ),
          ],
        ));
  }
}
