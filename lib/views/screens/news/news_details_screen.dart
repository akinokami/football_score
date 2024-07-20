import 'package:flutter/material.dart';
import 'package:football_score/models/news_model.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as html_parser;

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
        title:  Text('news_detail'.tr,style: TextStyle(color: Colors.white,fontSize: 20) ),
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
            Text(articles?.title??"",
                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
            Text(articles?.time??"",
                style: TextStyle(color: greyColor, fontSize: 15)),
            kSizedBoxH10,
            Image.network(imageUrl??"",height: 200,fit: BoxFit.cover,),
            kSizedBoxH10,
            Text(removeHtmlTags(articles?.body??""),
                style: TextStyle(color: Colors.white, fontSize: 15)),

          ],
        ),
      ),
    );
  }
}
