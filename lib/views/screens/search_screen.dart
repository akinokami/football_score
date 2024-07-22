import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/news/news_details_screen.dart';
import 'package:get/get.dart';

import '../../controller/news_controller.dart';
import '../widgets/custom_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 20.h,
          backgroundColor: primaryColor,
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
                child: TextField(
                  controller: newsController.searchController,
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      newsController.searchController;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.w),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: MaterialButton(
                        color: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        onPressed: () {
                          newsController.searchNews();
                          if (newsController.searchController.text.isEmpty) {
                            Get.snackbar('error'.tr, 'please_enter_text'.tr);
                          }
                        },
                        child: Text('search'.tr,
                            style: TextStyle(
                                color: Colors.white, fontSize: 10.sp)),
                      ),
                    ),
                    hintText: 'search'.tr,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
                    prefixIcon:
                        Icon(Icons.search, color: Colors.white, size: 18.sp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              kSizedBoxH10,
              Expanded(
                child: Obx(
                  () => newsController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (newsController.searchArticleList.isNotEmpty)
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  newsController.searchArticleList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => NewsDetailsScreen(
                                        articles: newsController
                                            .searchArticleList[index].body,
                                        imageUrl: newsController
                                            .searchArticleList[index].thumb,
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
                                          CachedNetworkImage(
                                            width: 70.w,
                                            height: 70.h,
                                            imageUrl: newsController
                                                    .searchArticleList[index]
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
                                          kSizedBoxW10,
                                          Expanded(
                                            child: CustomText(
                                              text: newsController
                                                      .searchArticleList[index]
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
                                text: "No Search Data Found",
                              ),
                            ),
                ),
              )
            ],
          ),
        ));
  }
}
