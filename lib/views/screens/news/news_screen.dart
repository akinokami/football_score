import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/controller/app_config_controller.dart';
import 'package:football_score/controller/news_controller.dart';
import 'package:football_score/utils/app_theme.dart';
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
        toolbarHeight: 20,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Obx(
              () => appConfigController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 35,
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
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: newsController.selectedIndex.value ==
                                            index
                                        ? secondaryColor
                                        : greyColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: CustomText(
                                  text: appConfigController
                                          .newsTabList[index].label ??
                                      '',
                                  textColor:
                                      newsController.selectedIndex.value ==
                                              index
                                          ? whiteColor
                                          : blackTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => newsController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: newsController.articleList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => NewsDetailsScreen(
                                  articles:
                                      newsController.articleList[index].body,
                                  imageUrl:
                                      newsController.articleList[index].thumb,
                                ),
                              );
                            },
                            child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      width: 75,
                                      height: 75,
                                      imageUrl: newsController
                                              .articleList[index].thumb ??
                                          '',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: newsController
                                                .articleList[index].title ??
                                            '',
                                        maxLines: 3,
                                        textColor: whiteColor,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
