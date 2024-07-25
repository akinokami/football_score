import 'package:fast_cached_network_image/fast_cached_network_image.dart';
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
        title: CustomText(
          text: 'news_detail'.tr,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(kPadding15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: ListView(
          children: [
            CustomText(
              text: articles?.title ?? "",
              fontWeight: FontWeight.bold,
              size: 14.sp,
              maxLines: 3,
              textColor: Colors.white,
            ),
            CustomText(
              text: articles?.time ?? "",
            ),
            kSizedBoxH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child:
              FastCachedImage(
                width: double.infinity,
                height: 180.h,
                fit: BoxFit.cover,
                url: imageUrl ??
                    "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                fadeInDuration: const Duration(seconds: 1),
                errorBuilder: (context, exception, stacktrace) {
                  return Image.asset(
                    "assets/images/football_news.webp",
                    fit: BoxFit.cover,
                    height: 180.h,
                    width: double.infinity,
                  );
                },
                loadingBuilder: (context, progress) {
                  debugPrint(
                      'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                  return Container(
                    height: 180.h,
                    width: double.infinity,
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
            kSizedBoxH10,
            Text(removeHtmlTags(articles?.body ?? ""),
                style: TextStyle(color: Colors.white, fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }
}
