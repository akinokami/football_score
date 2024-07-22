import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/models/news_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as html_parser;

import '../../widgets/custom_text.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, this.articles, this.imageUrl});
  final Body? articles;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    String removeHtmlTags(String htmlString) {
      var document = html_parser.parse(htmlString);
      return document.body?.text ?? '';
    }
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title:  CustomText(text:'news_detail'.tr,size: 16.sp,fontWeight: FontWeight.bold,),
      ),
      body: Container(
        padding: const EdgeInsets.all(kPadding15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          color: primaryColor,
        ),
        child:  ListView(
          children: [
            CustomText(text:articles?.title??"",fontWeight: FontWeight.bold,size: 14.sp,textColor: Colors.white,),

            CustomText(text:articles?.time??"",
               ),
            kSizedBoxH10,
            Image.network(imageUrl??"",height: 180.h,fit: BoxFit.cover,),
            kSizedBoxH10,
            Text(removeHtmlTags(articles?.body??""),style:  TextStyle(color: Colors.white,fontSize: 12.sp)),


          ],
        ),
      ),
    );
  }
}
