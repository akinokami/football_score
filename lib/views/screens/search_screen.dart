import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:get/get.dart';

import '../../controller/news_controller.dart';

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
        body: Column(
          children: [
            TextField(
              controller: newsController.searchController,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                if (value.isEmpty) {
                  newsController.searchController;
                }
              },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding:  EdgeInsets.only(right: 8.w),
                  child: MaterialButton(
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    onPressed: () {
                      newsController.searchNews();
                      if(newsController.searchController.text.isEmpty){
                        Get.snackbar('error'.tr, 'please_enter_text'.tr);
                      }
                    },
                    child: Text('search'.tr,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                hintText: 'search'.tr,
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
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
            kSizedBoxH10,
            Expanded(
                child: Container(
              color: Colors.white,
            ))
          ],
        ));
  }
}
