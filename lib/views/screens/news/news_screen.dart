import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/news_controller.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'news_details_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigController = Get.put(AppConfigController());
    final newsController = Get.put(NewsController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 12.h,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Obx(
                () => appConfigController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : appConfigController.newsTabList.isNotEmpty
                        ? SizedBox(
                            height: 28.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: appConfigController.newsTabList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      newsController.changeIndex(
                                          index,
                                          appConfigController
                                                  .newsTabList[index].api ??
                                              '');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: newsController
                                                      .selectedIndex.value ==
                                                  index
                                              ? secondaryColor
                                              : greyColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r))),
                                      child: CustomText(
                                        text: appConfigController
                                                .newsTabList[index].label ??
                                            '',
                                        textColor: newsController
                                                    .selectedIndex.value ==
                                                index
                                            ? whiteColor
                                            : blackTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CustomText(
                              text: "No Data Found",
                            ),
                          ),
              ),
              kSizedBoxH20,
              Expanded(
                child: Obx(
                  () => newsController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (newsController.articleList.isNotEmpty)
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: newsController.articleList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => NewsDetailsScreen(
                                        articles: newsController
                                            .articleList[index].body,
                                        imageUrl: newsController
                                            .articleList[index].thumb,
                                      ),
                                    );
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 5.w),
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: cardColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child:
                                            FastCachedImage(
                                              width: 70.w,
                                              height: 70.h,
                                              fit: BoxFit.cover,
                                              url: newsController
                                                      .articleList[index]
                                                      .thumb ??
                                                  "https://fawslfulltime.co.uk/wp/wp-content/uploads/2019/01/football.jpg",
                                              fadeInDuration:
                                                  const Duration(seconds: 1),
                                              errorBuilder: (context, exception,
                                                  stacktrace) {
                                                return Image.asset(
                                                    "assets/images/football_news.webp",
                                                    fit: BoxFit.cover,
                                                    width: 70.w,
                                                    height: 70.w);
                                              },
                                              loadingBuilder:
                                                  (context, progress) {
                                                debugPrint(
                                                    'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                                return Container(
                                                  height: 70.h,
                                                  width: 70.w,
                                                  color: secondaryColor,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      if (progress
                                                              .isDownloading &&
                                                          progress.totalBytes !=
                                                              null)
                                                        Text(
                                                            '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .red)),
                                                      Center(
                                                        child: SizedBox(
                                                            width: 10,
                                                            height: 10,
                                                            child: CircularProgressIndicator(
                                                                color: Colors
                                                                    .white,
                                                                value: progress
                                                                    .progressPercentage
                                                                    .value)),
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
                                          kSizedBoxW10,
                                          Expanded(
                                            child: CustomText(
                                              text: newsController
                                                      .articleList[index]
                                                      .title ??
                                                  '',
                                              maxLines: 3,
                                              textColor: whiteColor,
                                              size: 12.sp,
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            )
                          : const Center(
                              child: CustomText(
                                text: "No Data Found",
                              ),
                            ),
                ),
              )
            ],
          ),
        ));
  }
}
