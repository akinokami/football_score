import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_score/controller/news_controller.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsConroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          centerTitle: true,
        ),
        body: Obx(
          () => newsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              newsController.appModel.value.menus?.news?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  newsController.changeIndex(
                                      index,
                                      newsController.appModel.value.menus
                                              ?.news?[index].api ??
                                          '');
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          newsController.selectedIndex.value ==
                                                  index
                                              ? Colors.green
                                              : Colors.white,
                                      border: Border.all(
                                        color: Colors.green,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: CustomText(
                                    text: newsController.appModel.value.menus
                                            ?.news?[index].label ??
                                        '',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Obx(
                          () => newsController.isLoadingNews.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: newsController.articleList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        //
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              CachedNetworkImage(
                                                width: 75,
                                                height: 75,
                                                imageUrl: newsController
                                                        .articleList[index]
                                                        .thumb ??
                                                    '',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  text: newsController
                                                          .articleList[index]
                                                          .title ??
                                                      '',
                                                  maxLines: 3,
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
        ));
  }
}
